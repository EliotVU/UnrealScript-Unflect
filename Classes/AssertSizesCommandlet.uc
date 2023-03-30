class AssertSizesCommandlet extends Commandlet;

// Hardcoded sizes for UT2004, because we cannot acquire the sizes of non-native classes.

const FieldSize = sizeof(Field);
const UFieldSize = 56;

const PropertySize = sizeof(Property);
const UPropertySize = 112;

event int Main(string parms)
{
    assert (FieldSize == UFieldSize);
    assert (PropertySize == UPropertySize);

    return 1;
}