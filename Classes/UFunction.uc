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