# UnrealScript-CastExploit
A proof-of-concept that exploits the UnrealScript compiler to trick it into compiling an illegal class casting.
By for example casting a UFunction instance to our own mirrored-UFunction we can retrieve the values of stricly native-only fields.
