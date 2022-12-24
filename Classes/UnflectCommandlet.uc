/**
 * A commandlet to quickly demonstrate and test the native-mapping.
 * - EliotVU
 */
class UnflectCommandlet extends Commandlet;

var UFunctionCast FunctionCaster;
var UClassCast ClassCaster;

event int Main(string parms)
{
    local Object obj;
    local UFunction uFunction;
    local UClass uClass;

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

        UClass = ClassCaster.Cast(Class(obj));
        log("text");
        log(uClass.ScriptText.Text);
    }

    return 1;
}

defaultproperties
{
    begin object class=UFunctionCast name=SubFunctionCaster
    end object
    FunctionCaster=SubFunctionCaster

    begin object class=UClassCast name=SubClassCaster
    end object
    ClassCaster=SubClassCaster
}