/**
 * Author: Marco
 */
class UChannel extends ServerObjectsBase;

// Variables.
var UNetConnection      Connection;     // Owner connection.
var int                 OpenAcked;      // Whether open has been acknowledged.
var int                 Closing;        // State of the channel.
var int                 ChIndex;        // Index of this channel.
var int                 OpenedLocally;  // Whether channel was opened locally or by remote.
var int                 OpenPacketId;   // Packet the spawn message was sent in.
var int                 OpenTemporary;  // Opened temporarily.
var EChannelType        ChType;         // Type of this channel.
var int                 NumInRec;       // Number of packets in InRec.
var int                 NumOutRec;      // Number of packets in OutRec.
var int                 NegotiatedVer;  // Negotiated version of engine = Min(client version, server version).
var int                 InRec;          // Incoming data with queued dependencies. (FInBunch*)
var int                 OutRec;         // Outgoing reliable unacked data. (FOutBunch*)
var int                 Broken;         // Has encountered errors and is ignoring subsequent packets.
var int                 bTornOff;       // Actor associated with this channel was torn off