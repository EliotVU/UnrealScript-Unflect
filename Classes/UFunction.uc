class UFunction extends UStruct within UState
    dependson(Unflect);

// protected:
var byte FunctionMD5Digest[16];

var int  FunctionFlags;
var byte NativeIndex[2];
var byte RepOffset[2];
var byte OperPrecedence;

var byte NumParms;
var byte ParmsSize[2];
var byte ReturnValueOffset[2];

final function static UFunction AsFunction(Object object)
{
    local Unflect.Object reference; local Unflect.Pointer pointer;
    local UFunction dereferenced;

    // assert (bool(Function(object)));

    reference.Object = object;
    pointer = reference;
    
    return dereferenced;
}