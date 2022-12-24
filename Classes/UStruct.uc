class UStruct extends UField;

var UTextBuffer		ScriptText;
var UTextBuffer		CppText;
var UField			Children;
var	int				PropertiesSize;
var	name			FriendlyName;
var	array<byte>		Script;

var	int				TextPos;
var	int				Line;
var	struct EStructFlags {
    var bool Native;
    var bool Export;
    var bool Long;
    var bool Init;
    var bool Unused1;
    var bool Unused2;
    var bool Unused3;
    var bool Unused4;
}				    StructFlags;

var Property		RefLink;
var Property		PropertyLink;
var Property		ConfigLink;
var Property		ConstructorLink;