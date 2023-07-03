/**
 * A commandlet to quickly demonstrate and test the native-mapping.
 * - EliotVU
 */
class UnflectCommandlet extends Commandlet
    dependson(Unflect);

final preoperator static UFunction Function(Object object)
{
    return class'UFunction'.static.AsFunction(object);
}

final preoperator static UFunction From(Function object)
{
    return Function object;
}

event int Main(string parms)
{
    local Object obj;
    local UFunction func;
    local UClass uClass;
    local UStruct uStruct;

    // Output all memory-loaded operators
    foreach AllObjects(class'Object', obj)
    {
        if (Function(obj) == none) continue;

        // static approach, no operator definitions are required.
        func = class'UFunction'.static.AsFunction(obj);
        // explicit and simple, but requires operators to be defined first.
        // func = Function obj;
        // with overloading, but need to cast to Function first.
        // func = From Function(obj);
        // legacy approach, requires a predefined subobject and caster class.
        // func = FunctionCaster.Cast(Function(obj))

        if ((func.FunctionFlags & 0x10) == 0x10)
        {
            Log("Function: " $ func @ "next Function: " $ func.Next);
            Log("  flags:" @ func.FunctionFlags);
            Log("  script size in memory:" @ func.Script.Length);
            Log("  friendlyname:" @ func.FriendlyName);
        }
    }

    // Export all memory-loaded class scripts
    foreach AllObjects(class'Object', obj)
    {
        if (Class(obj) == none) continue;

        uClass = class'UClass'.static.AsClass(obj);
        Log("text:");
        Log(uClass.ScriptText.Text);
    }

    // Uncomment for UT2004
    // DynamicLoadObject("Engine.CacheManager", class'CacheManager', false);
    foreach AllObjects(class'Object', obj)
    {
        if (obj.Class != class'Struct') continue;

        uStruct = class'UStruct'.static.AsStruct(obj);
        Log("Struct" @ uStruct @
            "  Native:" @ uStruct.StructFlags.Native @
            "  Export:" @ uStruct.StructFlags.Export @
            "  Long:" @ uStruct.StructFlags.Long @
            "  Init:" @ uStruct.StructFlags.Init
        );
    }

    return 1;
}

defaultproperties
{
}