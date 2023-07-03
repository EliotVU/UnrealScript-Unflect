class UState extends UStruct
    dependson(Unflect);

var Unflect.Int64   ProbeMask;
var Unflect.Int64   IgnoreMask;
var int             StateFlags;
var byte            LabelTableOffset[2];
var UField          VfHash[256];

final function static UState AsState(Object object)
{
    local Unflect.Object reference; local Unflect.Pointer pointer;
    local UState dereferenced;

    // assert (bool(State(object)));

    reference.Object = object;
    pointer = reference;
    
    return dereferenced;
}