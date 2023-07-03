class AssertSizesCommandlet extends Commandlet;

// Hardcoded sizes for UT2004, because we cannot acquire the sizes of non-native classes.

const ObjectSize = sizeof(Object);
const UObjectSize = 44;

const FieldSize = sizeof(Field);
const UFieldSize = 56;

const PropertySize = sizeof(Property);
const UPropertySize = 112;

const StructSize = sizeof(Struct);
const UStructSize = 132;

const FunctionSize = sizeof(Function);
const UFunctionSize = 152;

const StateSize = sizeof(State);
const UStateSize = 1180;

const ClassSize = sizeof(Class);
const UClassSize = 1316;

const TextBufferSize = sizeof(TextBuffer);
const UTextBufferSize = 68;

event int Main(string parms)
{
    assert (FieldSize == UFieldSize);
    assert (PropertySize == UPropertySize);
    assert (StructSize == UStructSize);
    assert (FunctionSize == UFunctionSize);
    assert (StateSize == UStateSize);
    assert (ClassSize == UClassSize);
    assert (TextBufferSize == UTextBufferSize);

    return 1;
}