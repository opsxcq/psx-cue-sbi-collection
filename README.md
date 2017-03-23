# Playstation cue and sbi files collection

This is a collection of `cue` and `sbi` files found around the web for **Playstation One (PSX)** roms.

* Over 8.5k files from redump.org
* Over 1.1k files from emuparadise.me



# Database

The file `disk.hash` contains the SHA-1 hash identification of bin, iso and mdf files. With the same name, but with the `.cue` extension you can find the corresponding cue file, just search it in this repo.



# What are `cue` files

Cue sheets can describe many types of audio and data CDs. The main data (including audio) for a CD described by a cue sheet is stored in one or more files referenced by the cue sheet. Cue sheets also specify track lengths, and CD-Text including track and disc titles and performers. They are especially useful when dividing audio stored in a single file into multiple songs or tracks. The data files referred to by the cue sheet may be audio files (commonly in MP3 or WAV format), or plain disc images, usually with a .bin extension.

When used for disc images, the format is usually called CUE/BIN, indicating that it stores a disc image composed of one cue sheet file and one or more .bin files. The .bin files are raw sector-by-sector binary copies of tracks in the original discs. These binary .bin files usually contain all 2,352 bytes from each sector in an optical disc, including control headers and error correction data in the case of CD-ROMs (unlike ISO images of CD-ROMs, which store only the user data). However, the TRACK command in a cue sheet file can be used to refer to binary disc images that contain only the user data of each sector, by indicating the specific CD mode of the tracks from which the image was created (which is necessary to know the size of the user data in each sector).

A cue sheet can also be a list of songs appearing in a film or TV show. The cue sheet shows all the music titles with metadata like composers, publishers, length of use, and shares of ownership. The cue sheet helps determine who should be paid when the film or TV show airs.

## Cue Sheet file format

A cue sheet is a plain text file containing commands with one or more parameters. The commands usually apply either to the whole disc or to an individual track, depending on the particular command and the context. They may describe the layout of data to be written, or CD-Text (metadata). The original specification of the cue sheet syntax and semantics appears in the CDRWIN User Guide.[4]

The standard commands are:

* `FILES` - Names a file containing the data and its format (such as MP3, and WAVE audio file formats, and plain "binary" disc images).
* `TRACK` - Defines a track context, providing its number and type or mode (for instance AUDIO or various CD-ROM modes). Some commands that follow this command apply to the track rather than the entire disc.
* `INDEX` - Indicates an index (position) within the current FILE. The position is specified in mm:ss:ff (minute-second-frame) format. There are 75 such frames per second of audio. In the context of cue sheets, "frames" refer to CD sectors, despite a different, lower-level structure in CDs also being known as frames.[6] INDEX 01 is required and denotes the start of the track, while INDEX 00 is optional and denotes the pregap. The pregap of Track 1 is used for Hidden Track One Audio (HTOA). Optional higher-numbered indexes (02 through 99) are also allowed.
* `PREGAP` and `POSTGAP` - Indicates the length of a track's pregap or postgap, which is not stored in any data file. The length is specified in the same minute-second-frame format as for INDEX.
* `REM` - Adds a comment that usually has no bearing on the written CD at all, with the exception of some applications that use it to store additional metadata (e.g. Exact Audio Copy writes some additional fields, which foobar2000 can read). REM should not appear on a line by itself as some applications regard it as a syntax error.
* `CDTEXTFILE` - Identifies a file containing CD-Text information.
* `FLAGS` - Sets subcode flags of a track.
* `CATALOG` - Contains the UPC/EAN code of the disc.
* `ISRC` - Define the ISRC of the current TRACK.
* `TITLE`, `PERFORMER` and `SONGWRITER` - CD-Text metadata; applies to the whole disc or a specific track, depending on the context. 



# Why you need a `.cue` file for ?

Withtou a `.cue` file, some games run without background music, just with sound effect. If you experience like that, most likely you don't have the right cue file.



# Generating a generic `cue` file

Along with this file collection, you can find a script called `generate-cue.sh`, this script will generate a default cue file, it's not guaranteed that it will work, but it's better than nothing.

The default cue file has this structure

```
FILE "filename" BINARY
  TRACK 01 MODE2/2352
    INDEX 01 00:00:00
```

This script hold a function, to use this function, you need to `source` the file.

```
source generate-cue.sh
```

 It's expected that you create a folder for each game, that will contain one or more disks. This script will generate both, `.cue` file for each disk and `.m3u` file containing the reference to all other cue files.

> Be aware that this script will delete **ALL** `.cue` files and `.m3u` files in that folder !

After that, just run the function

```
cue-gen 'filename.bin'
```