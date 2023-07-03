class UPropertyCommandlet extends Commandlet
    dependson(Unflect);

var(MyCategory) int MyCommentStringProperty "Hello world!";

event int Main(string parms)
{
    local UProperty uProperty;

    uProperty = Class'UProperty'.static.AsProperty(Property'MyCommentStringProperty');
    Log("MyCommentStringProperty:" @ uProperty);
    Log("MyCommentStringProperty.Category:" @ uProperty.Category);
    Log("MyCommentStringProperty.CommentString:" @ uProperty.CommentString);

    assert (uProperty.Category == 'MyCategory');
    // Cannot be compared due the escaped \n that the compiler is not preserving (UE2).
    // assert (uProperty.CommentString == "Hello world!\n");

    return 1;
}