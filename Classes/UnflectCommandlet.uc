/**
 * A commandlet to quickly demonstrate and test the native-mapping.
 * - EliotVU
 */
class UnflectCommandlet extends Commandlet
    dependson(Unflect);

var UFunctionCast FunctionCaster;
var UClassCast ClassCaster;
var UStructCast StructCaster;
var UPropertyCast PropertyCaster;

var(MyCategory) int MyCommentStringProperty "Hello world!";

event int Main(string parms)
{
    local Object obj;
    local UFunction uFunction;
    local UClass uClass;
    local UStruct uStruct;
    local UProperty uProperty;

    // Output all memory-loaded operators
    foreach AllObjects(class'Object', obj)
    {
        if (Function(obj) == none) continue;

        uFunction = FunctionCaster.Cast(Function(obj));
        if ((uFunction.FunctionFlags & 0x10) == 0x10)
        {
            Log("Function: " $ uFunction @ "next Function " $ uFunction.Next);
            Log("flags" @ uFunction.FunctionFlags);
            Log("script size in memory" @ uFunction.Script.Length);
            Log("friendlyname" @ uFunction.FriendlyName);
        }
    }

    // Export all memory-loaded class scripts
    foreach AllObjects(class'Object', obj)
    {
        if (Class(obj) == none) continue;

        uClass = ClassCaster.Cast(Class(obj));
        Log("text");
        Log(uClass.ScriptText.Text);
    }

    // Uncomment for UT2004
    // DynamicLoadObject("Engine.CacheManager", class'CacheManager', false);
    foreach AllObjects(class'Object', obj)
    {
        if (obj.Class != class'Struct') continue;

        uStruct = StructCaster.Cast(obj);
        Log("Struct" @ uStruct @
            "Native:" @ uStruct.StructFlags.Native @
            "Export:" @ uStruct.StructFlags.Export @
            "Long:" @ uStruct.StructFlags.Long @
            "Init:" @ uStruct.StructFlags.Init
        );
    }

    uProperty = PropertyCaster.Cast(Property'MyCommentStringProperty');
    Log("MyCommentStringProperty:" @ uProperty);
    Log("MyCommentStringProperty.Category:" @ uProperty.Category);
    Log("MyCommentStringProperty.CommentString:" @ uProperty.CommentString);

    return 1;
}

defaultproperties
{
    begin object class=UStructCast name=SubStructCaster
    end object
    StructCaster=SubStructCaster

    begin object class=UFunctionCast name=SubFunctionCaster
    end object
    FunctionCaster=SubFunctionCaster

    begin object class=UClassCast name=SubClassCaster
    end object
    ClassCaster=SubClassCaster

    begin object class=UPropertyCast name=SubPropertyCaster
    end object
    PropertyCaster=SubPropertyCaster
}