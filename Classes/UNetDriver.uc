/**
 * UnrealScript representive of TcpNetDriver
 * Author: Marco
 */
class UNetDriver extends ServerObjectsBase;

var transient const int                 ExecVtbl;
var transient array<UNetConnection>     ClientConnections;
var transient UNetConnection            ServerConnection;
// 4356
// var byte TestOffset[20000];
var int Dummy[1088];
var transient ULevel                    Notify;
var transient UPackageMap               MasterMap;

// final function byte GetData(int i)
// {
//     return TestOffset[i];
// }