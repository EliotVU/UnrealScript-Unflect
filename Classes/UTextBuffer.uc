class UTextBuffer extends Object
    dependson(Unflect);

var private native const pointer OutputDeviceVtbl;

var int Pos, Top;
var string Text;

final function static UTextBuffer AsTextBuffer(Object object)
{
    local Unflect.Object reference; local Unflect.Pointer pointer;
    local UTextBuffer dereferenced;

    // assert (bool(TextBuffer(object)));

    reference.Object = object;
    pointer = reference;
    
    return dereferenced;
}