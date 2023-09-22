class Unflect extends Object
    abstract;

const RF_Native     = 0x04000000;

const FUNC_Final	= 0x00000001;
const FUNC_Native   = 0x00000400;

struct Int64
{
    var int h, l;
};

struct Array { var pointer Data; var int Num, Max; };

struct Pointer { };
struct Object extends Pointer { var Object Object; };

const UnFunction = Class'UFunction';

final static function HookFunction(UFunction source, UFunction destination) {
    // de-nativify
    if ((source.FunctionFlags & FUNC_Native) != 0) {
        source.FunctionFlags = source.FunctionFlags & ~FUNC_Native;
        source.NativeIndex[0] = 0;
        source.NativeIndex[1] = 0;
    }

    // Copy the script's data pointer
    // source.Script.Data = destination.Script.Data;
    // source.Script.Num = destination.Script.Num;
    // source.Script.Max = destination.Script.Max;
    source.Script = destination.Script;
}

final static function Proxify(UClass source, UClass destination) {
    local UField field, other;

    for (field = source.Children; bool(field); field = field.Next) {
        if (bool(UFunction(field))) {
            for (other = destination.Children; bool(other); other = other.Next) {
                if (other.Name == field.Name) {
                    HookFunction(
                        UnFunction.static.AsFunction(field),
                        UnFunction.static.AsFunction(other)
                    );
                }
            }
        }
    }
}