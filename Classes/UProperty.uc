class UProperty extends UField within UField
    abstract;

var int                 ArrayDim;
var int                 ElementSize;
var int                 PropertyFlags;
var name                Category;

// FIXME: Doesn't align well when using Primitive.Int16 (padding?)
// var Primitive.Int16     RepOffset;
var byte                RepOffset[2];
// var Primitive.Int16     RepIndex;
var byte                RepIndex[2];

var transient int       Offset;
var transient UProperty PropertyLinkNext;
var transient UProperty ConfigLinkNext;
var transient UProperty ConstructorLinkNext;
var transient UProperty NextRef;
var transient UProperty RepOwner;

var string              CommentString;