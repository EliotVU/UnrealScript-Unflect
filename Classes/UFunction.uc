class UFunction extends UStruct within UState
    dependson(Unflect);

// protected:
var byte             FunctionMD5Digest[16];

var int              FunctionFlags;
var Unflect.Int16    NativeIndex;
var Unflect.Int16    RepOffset;
var byte             OperPrecedence;

var byte             NumParms;
var Unflect.Int16    ParmsSize;
var Unflect.Int16    ReturnValueOffset;