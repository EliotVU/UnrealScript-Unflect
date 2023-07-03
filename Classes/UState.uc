class UState extends UStruct
    dependson(Unflect);

var Unflect.Int64   ProbeMask;
var Unflect.Int64   IgnoreMask;
var int             StateFlags;
var byte            LabelTableOffset[2];
var UField          VfHash[256];