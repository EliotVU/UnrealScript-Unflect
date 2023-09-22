class UStruct extends UField
    dependson(Unflect);

var UTextBuffer     ScriptText;
var UTextBuffer     CppText;
var UField          Children;
var int             PropertiesSize;
var name            FriendlyName;
// Swap if you need to modify the bytes at runtime
// var array<byte>     Script;
var Unflect.Array   Script;

var int             TextPos;
var int             Line;
var struct EStructFlags {
    var bool Native;
    var bool Export;
    var bool Long;
    var bool Init;
    var bool Unused1;
    var bool Unused2;
    var bool Unused3;
    var bool Unused4;
}                   StructFlags;

var Property        RefLink;
var Property        PropertyLink;
var Property        ConfigLink;
var Property        ConstructorLink;

final function static UStruct AsStruct(Object object)
{
    local Unflect.Object reference; local Unflect.Pointer pointer;
    local UStruct dereferenced;

    // assert (bool(Struct(object)));

    reference.Object = object;
    pointer = reference;
    
    return dereferenced;
}