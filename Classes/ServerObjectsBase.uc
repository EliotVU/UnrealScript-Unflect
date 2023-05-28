/**
 * Author: Marco
 */
class ServerObjectsBase extends Object
    abstract;

// Types of channels.
enum EChannelType
{
    CHTYPE_None,    // Invalid type.
    CHTYPE_Control, // Connection control.
    CHTYPE_Actor,   // Actor-update channel.
    CHTYPE_File,    // Binary file transfer.
    CHTYPE_Voice    // VOIP
};