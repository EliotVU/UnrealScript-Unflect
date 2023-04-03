/**
 * Utility class for function replacement and other useful stuff
 * Shtoyan
 */
class CoreAPI extends Object abstract;


// struct for batch function replacement
struct FunctionRecord
{
    var string Info;    // why we replace this function
    var string Replace; // original function with format "package.class.target_function"
    var string With;    // replacement function with format "class.new_function"
};

var private UFunctionCast FunctionCaster;
var private UPropertyCast PropertyCaster;


// replace a single function
// ALWAYS pass `self` as a first parameter, so we can load caller's package and classes!
public final static function ReplaceFunction(object caller, string Replace, string With)
{
    local uFunction A, B;

    // This removes the need to declare variables for every new class we make
    // vanilla classes or 3rd party mutator classes
    DynamicLoadObject(GetClassName(Replace), class'class', true);
    // classes with our edited functions
    // `caller.class.outer.name` returns caller's package name
    DynamicLoadObject(caller.class.outer.name $ "." $ Left(With, InStr(With,".")), class'class', true);

    A = default.FunctionCaster.Cast(function(FindObject(Replace, class'function')));
    B = default.FunctionCaster.Cast(function(FindObject(With, class'function')));

    if (A == none)
    {
        warn("> Failed to process " $ Replace);
        return;
    }
    if (B == none)
    {
        warn("> Failed to process " $ With);
        return;
    }

    // do the thing! switch functions
    A.Script = B.Script;
    log("> Processing " $ Replace $ "    ---->    " $ With);
}

// replace array of functions
public final static function ReplaceFunctionArray(object caller, array<FunctionRecord> functionList)
{
    local int idx;

    for (idx = 0; idx < functionList.length; idx++)
    {
        ReplaceFunction(caller, functionList[idx].Replace, functionList[idx].With);
    }
}

// get the "package + dot + class" string for DynamicLoadObject()
private final static function string GetClassName(string input)
{
    local array<string> parts;

    // create an array
    split(input, ".", parts);

    // state functions
    if (parts.length == 4)
    {
        ReplaceText(input, "." $ parts[2], "");
        ReplaceText(input, "." $ parts[3], "");
    }
    // non-state functions
    else
        ReplaceText(input, "." $ parts[2], "");

    return input;
}

public final static function string GetTypeMetaData(Property property) {
    local UProperty uProperty;

    uProperty = default.PropertyCaster.Cast(property);
    // Compiler should not let you to pass invalid `Property`, but just in case
    if (uProperty == none)
    {
        warn("Invalid property!");
        return "";
    }
    else
    {
        return uProperty.CommentString;
    }
}

defaultproperties
{
    begin object class=UFunctionCast name=SubFunctionCaster
    end object
    FunctionCaster=SubFunctionCaster

    begin object class=UPropertyCast name=SubPropertyCaster
    end object
    PropertyCaster=SubPropertyCaster
}