/**
 * A commandlet to quickly demonstrate and test the native-mapping.
 * - EliotVU
 */
class UnflectCommandlet extends Commandlet;

var UFunctionCast FunctionCaster;
var UClassCast ClassCaster;
var UStructCast StructCaster;

event int Main(string parms)
{
    local Object obj;
    local UFunction uFunction;
    local UClass uClass;
    local uStruct uStruct;

    // Output all memory-loaded operators
    foreach AllObjects(class'Object', obj)
    {
        if (Function(obj) == none) continue;

        uFunction = FunctionCaster.Cast(Function(obj));
        if ((uFunction.FunctionFlags & 0x10) == 0x10)
        {
            log("Function: " $ uFunction @ "next Function " $ uFunction.Next);
            log("flags" @ uFunction.FunctionFlags);
            log("script size in memory" @ uFunction.Script.Length);
            log("friendlyname" @ uFunction.FriendlyName);
        }
    }

    // Export all memory-loaded class scripts
    foreach AllObjects(class'Object', obj)
    {
        if (Class(obj) == none) continue;

        uClass = ClassCaster.Cast(Class(obj));
        log("text");
        log(uClass.ScriptText.Text);
    }

    // Uncomment for UT2004
    // DynamicLoadObject("Engine.CacheManager", class'CacheManager', false);
    foreach AllObjects(class'Object', obj)
    {
        if (obj.Class != class'Struct') continue;

        uStruct = StructCaster.Cast(obj);
        log("Struct" @ uStruct @
            "Native:" @ uStruct.StructFlags.Native @
            "Export:" @ uStruct.StructFlags.Export @
            "Long:" @ uStruct.StructFlags.Long @
            "Init:" @ uStruct.StructFlags.Init
        );
    }

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
}