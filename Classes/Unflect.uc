class Unflect extends Object
    abstract;

struct Int64
{
    var int h, l;
};

struct Pointer { };
struct Object extends Pointer { var Object Object; };