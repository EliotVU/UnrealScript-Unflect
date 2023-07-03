class UProperty extends UField within UField
    dependson(Unflect)
    abstract;

var int                 ArrayDim;
var int                 ElementSize;
var int                 PropertyFlags;
var name                Category;

var byte                RepOffset[2];
var byte                RepIndex[2];

var transient int       Offset;
var transient UProperty PropertyLinkNext;
var transient UProperty ConfigLinkNext;
var transient UProperty ConstructorLinkNext;
var transient UProperty NextRef;
var transient UProperty RepOwner;

var string              CommentString;

final function static UProperty AsProperty(Object object)
{
    local Unflect.Object reference; local Unflect.Pointer pointer;
    local UProperty dereferenced;

    // assert (bool(Property(object)));

    reference.Object = object;
    pointer = reference;
    
    return dereferenced;
}