class UFunction extends UStruct within UState;

// protected:
var byte               FunctionMD5Digest[16];

var int                FunctionFlags;
var Primitive.Int16    NativeIndex;
var Primitive.Int16    RepOffset;
var	byte               OperPrecedence;

var	byte               NumParms;
var Primitive.Int16    ParmsSize;
var Primitive.Int16    ReturnValueOffset;