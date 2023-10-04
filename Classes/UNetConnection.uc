/**
 * Author: Marco
 */
class UNetConnection extends Player
    dependson(Unflect);

const MAX_CHANNELS=1023;

struct FURL
{
    // URL components.
    var string Protocol;    // Protocol, i.e. "unreal" or "http".
    var string Host;        // Optional hostname, i.e. "204.157.115.40" or "unreal.epicgames.com", blank if local.
    var int Port;           // Optional host port.
    var string Map;         // Map name, i.e. "SkyCity", default is "Index".
    var array<string> Op;   // Options.
    var string Portal;      // Portal to enter through, default is "".

    // Status.
    var int Valid;          // Whether parsed successfully.
};
enum EConnectionState
{
    USOCK_Invalid,  // Connection is invalid, possibly uninitialized.
    USOCK_Closed,   // Connection permanently closed.
    USOCK_Pending,  // Connection is awaiting connection.
    USOCK_Open,     // Connection is open.
};
struct FBitWriterMark
{
    var int             Overflowed;
    var int             Num;
};
struct FArchive
{
    // Status variables.
    var int ArVer;
    var int ArNetVer;
    var int ArLicenseeVer;
    var int ArIsLoading;
    var int ArIsSaving;
    var int ArIsTrans;
    var int ArIsPersistent;
    var int ArForEdit;
    var int ArForClient;
    var int ArForServer;
    var int ArIsError;
    var int ArIsCriticalError;
    var int ArMaxSerializeSize;
};
struct FBitWriter extends FArchive
{
    var array<byte> Buffer;
    var int   Num;
    var int   Max;
};
struct FOutBunch extends FBitWriter
{
    // Variables.
    var int             Next;
    var Object          Channel;
    var Unflect.Int64   Time;
    var int             ReceivedAck;
    var int             ChIndex;
    var int             ChType;
    var int             ChSequence;
    var int             PacketId;
    var byte            bOpen;
    var byte            bClose;
    var byte            bReliable;
};

// Connection information.
var UNetDriver          Driver;                 // Owning driver.
var EConnectionState    State;                  // State this connection is in.
var FURL                URL;                    // URL of the other side.
var UPackageMap         PackageMap;             // Package map between local and remote.

// Negotiated parameters.
var int                 ProtocolVersion;        // Protocol version we're communicating with (<=PROTOCOL_VERSION).
var int                 MaxPacket;              // Maximum packet size.
var int                 PacketOverhead;         // Bytes overhead per packet sent.
var int                 InternalAck;            // Internally ack all packets, for 100% reliable connections.
var int                 Challenge;              // Server-generated challenge.
var int                 NegotiatedVer;          // Negotiated version for new channels.
var int                 UserFlags;              // User-specified flags.
var string              RequestURL;             // URL requested by client

// CD key authentication
var string              CDKeyHash;              // Hash of client's CD key
var string              CDKeyResponse;          // Client's response to CD key challenge

// Internal.
var Unflect.Int64       LastReceiveTime;        // Last time a packet was received, for timeout checking.
var Unflect.Int64       LastSendTime;           // Last time a packet was sent, for keepalives.
var Unflect.Int64       LastTickTime;           // Last time of polling.
var Unflect.Int64       LastRepTime;            // Time of last replication.
var int                 QueuedBytes;            // Bytes assumed to be queued up.
var int                 TickCount;              // Count of ticks.

// Merge info.
var FBitWriterMark      LastStart;              // Most recently sent bunch start.
var FBitWriterMark      LastEnd;                // Most recently sent bunch end.
var int                 AllowMerge;             // Whether to allow merging.
var int                 TimeSensitive;          // Whether contents are time-sensitive.
var int                 LastOutBunch;           // Most recent outgoing bunch.
var FOutBunch           LastOut;

// Stat display.
var Unflect.Int64       StatUpdateTime;         // Time of last stat update.
var float               StatPeriod;             // Interval between gathering stats.
var float               InRate,    OutRate;     // Rate for last interval.
var float               InPackets, OutPackets;  // Packet counts.
var float               InBunches, OutBunches;  // Bunch counts.
var float               InLoss,    OutLoss;     // Packet loss percent.
var float               InOrder,   OutOrder;    // Out of order incoming packets.
var float               BestLag,   AvgLag;      // Lag.

// 8256

// Stat accumulators.
var float               LagAcc, BestLagAcc;     // Previous msec lag.
var int                 InLossAcc, OutLossAcc;  // Packet loss accumulator.
var int                 InPktAcc,  OutPktAcc;   // Packet accumulator.
var int                 InBunAcc,  OutBunAcc;   // Bunch accumulator.
var int                 InByteAcc, OutByteAcc;  // Byte accumulator.
var int                 InOrdAcc,  OutOrdAcc;   // Out of order accumulator.
var int                 LagCount;               // Counter for lag measurement.
var int                 HighLossCount;          // Counts high packet loss.
var Unflect.Int64       LastTime, FrameTime;    // Monitors frame time.
var Unflect.Int64       CumulativeTime, AverageFrameTime;
var int                 CountedFrames;

// Packet.
var FBitWriter          Out;                    // Outgoing packet.
var Unflect.Int64       OutLagTime[256];        // For lag measuring.
// 6044
var int                 OutLagPacketId[256];    // For lag measuring.
var int                 InPacketId;             // Full incoming packet index.
var int                 OutPacketId;            // Most recently sent packet.
var int                 OutAckPacketId;         // Most recently acked outgoing packet.

// 5008
var int Dummy[1252]; // Unknown data...

// var byte TestOffset[20000];

// Channel table.
var UChannel            Channels[MAX_CHANNELS];

var array<int>          InReliable;
var array<int>          QueuedAcks, ResendAcks;
var array<UChannel>     OpenChannels;
var array<Actor>        SentTemporaries;

// TODO test!
final function UChannel GetChannel(int i)
{
    return Channels[i];
}

// final function byte GetData(int i)
// {
//     return TestOffset[i];
// }