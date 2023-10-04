/**
 * Author: Marco
 */
class UFileChannel extends UChannel;

// Receive Variables.
var Object          Download;           // UDownload when receiving.

// Send Variables.
var int             SendFileAr;         // File being sent. (FArchive*)
var byte            SrcFilename[512];   // Filename being sent. (TCHAR)
var int             PackageIndex;       // Index of package in map.
var int             SentData;           // Number of bytes sent.

final function GetFileName(out byte N[ArrayCount(SrcFilename)])
{
    local int i;

    for (i = 0; i < ArrayCount(SrcFilename); ++i)
    {
        N[i] = SrcFilename[i];
    }
}