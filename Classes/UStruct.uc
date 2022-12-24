class UStruct extends UField;

var UTextBuffer		ScriptText;
var UTextBuffer		CppText;
var UField			Children;
var	int				PropertiesSize;
var	name			FriendlyName;
var	array<byte>		Script;

var	int				TextPos;
var	int				Line;
var	int				StructFlags;

var Property		RefLink;
var Property		PropertyLink;
var Property		ConfigLink;
var Property		ConstructorLink;