/**
 * Author: Marco
 */
class ULevel extends ServerObjectsBase;

// var byte TestOffset[10000];
var int Dummy;              // Unknown data.

// Database.
var array<Actor>            Actors;     // 4
var Object                  TransArray; // 16

// Variables.
var UNetDriver              NetDriver;  // 20
var Engine                  Engine;     // 24
var UNetConnection.FURL     URL;
var UNetDriver              DemoRecDriver;

// final function byte GetData(int i)
// {
//     return TestOffset[i];
// }