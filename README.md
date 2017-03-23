# Playstation cue and sbi files collection

This is a collection of `cue` and `sbi` files found around the web.

* Over 8.5k files from redump.org
* Over 1.1k files from emuparadise.me

## Database

The file `disk.hash` contains the SHA-1 hash identification of bin, iso and mdf files. With the same name, but with the `.cue` extension you can find the corresponding cue file, just search it in this repo.

## What are `cue` files

Cue sheets can describe many types of audio and data CDs. The main data (including audio) for a CD described by a cue sheet is stored in one or more files referenced by the cue sheet. Cue sheets also specify track lengths, and CD-Text including track and disc titles and performers. They are especially useful when dividing audio stored in a single file into multiple songs or tracks. The data files referred to by the cue sheet may be audio files (commonly in MP3 or WAV format), or plain disc images, usually with a .bin extension.

When used for disc images, the format is usually called CUE/BIN, indicating that it stores a disc image composed of one cue sheet file and one or more .bin files. The .bin files are raw sector-by-sector binary copies of tracks in the original discs. These binary .bin files usually contain all 2,352 bytes from each sector in an optical disc, including control headers and error correction data in the case of CD-ROMs (unlike ISO images of CD-ROMs, which store only the user data). However, the TRACK command in a cue sheet file can be used to refer to binary disc images that contain only the user data of each sector, by indicating the specific CD mode of the tracks from which the image was created (which is necessary to know the size of the user data in each sector).

A cue sheet can also be a list of songs appearing in a film or TV show. The cue sheet shows all the music titles with metadata like composers, publishers, length of use, and shares of ownership. The cue sheet helps determine who should be paid when the film or TV show airs.

## Generating a generic `cue` file

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