class UField extends Object
    dependson(Unflect)
    abstract;

var UField SuperField;
var UField Next;
var UField HashNext;

final function static UField AsField(Object object)
{
    local Unflect.Object reference; local Unflect.Pointer pointer;
    local UField dereferenced;

    // assert (bool(Field(object)));

    reference.Object = object;
    pointer = reference;
    
    return dereferenced;
}