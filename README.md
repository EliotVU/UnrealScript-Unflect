# Unflect

Unflect is a proof-of-concept that exploits the UnrealScript compiler to trick it into compiling an illegal class casting.
By for example casting a UFunction instance to our own mirrored-UFunction lets us retrieve the values of stricly native-only fields.

![image](https://user-images.githubusercontent.com/808593/209421678-9aeb41d0-8f6b-4f93-b2f0-3b4035fd74ee.png)

## Compiling

The source is written for Unreal Tournament 2004, but the code should compile for most UE2 games, possibly requiring some minor alignment changes in the native mirror classes.

* Requires /System/MakeCommandletUtils.u
* Run make.bat (The directory with the /Classes/ directory has to be located at the root of the UE2 installation e.g. (C:\\UT2004/Unflect/).
* Run test.bat to confirm that everything's working.

## Usage

Replacing functions:

* Add Unflect as a dependency for your mod.
* Extend new class from the class where you want to replace a function.
* **DO NOT** change function declaration and argument types / amount.
* **DO NOT** create new local variables. It will lead to random crashes.
  * If you need additional variables, make them global and access as `class'myNewClass'.default.myNewVariable`.
* If you want to call or override parent code, make sure that you fill in correct class name. Aka `super(exactParentClass).PostBeginPlay()` instead of `super.PostBeginPlay()`. That will save you from runaway loop crashes.
* Make your edits and call the replacement function:

```cpp
class'CoreAPI'.static.ReplaceFunction(Self, "package.class.targetFunction", "myNewClass.newFunction")
```
