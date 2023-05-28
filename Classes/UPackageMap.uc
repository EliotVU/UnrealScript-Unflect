/**
 * Author: Marco
 */
class UPackageMap extends ServerObjectsBase;

/* PackageFlags:
    PKG_AllowDownload   = 0x0001,   // Allow downloading package.
    PKG_ClientOptional  = 0x0002,   // Purely optional for clients.
    PKG_ServerSideOnly  = 0x0004,   // Only needed on the server side.
    PKG_Unsecure        = 0x0010,   // Not trusted.
    PKG_Need            = 0x8000,   // Client needs to download this package.
*/

struct FPackageInfo
{
    // Variables.
    var string          URL;                // URL of the package file we need to request.
    var Object          Linker;             // Pointer to the linker, if loaded.
    var Object          Parent;             // The parent package.
    var Guid            Guid;               // Package identifier.
    var int             FileSize;           // File size.
    var int             DownloadSize;       // Download size.
    var int             ObjectBase;         // Net index of first object.
    var int             ObjectCount;        // Number of objects, defined by server.
    var int             NameBase;           // Net index of first name.
    var int             NameCount;          // Number of names, defined by server.
    var int             LocalGeneration;    // This machine's generation of the package.
    var int             RemoteGeneration;   // Remote machine's generation of the package.
    var int             PackageFlags;       // Package flags.
};

// Variables.
var array<FPackageInfo> List;