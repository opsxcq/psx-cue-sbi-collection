# Playstation cue and sbi files collection

This is a collection of `cue` and `sbi` files found around the web.

* Over 8.5k files from redump.org
* Over 1.1k files from emuparadise.me

## Database

The file `disk.hash` contains the SHA-1 hash identification of bin, iso and mdf files. With the same name, but with the `.cue` extension you can find the corresponding cue file, just search it in this repo.



## What are `cue` files

## Generating a generic `cue` file

Along with this file collection, you can find a script called `generate-cue.sh`, this script will generate a default cue file, it's not guaranteed that it will work, but it's better than nothing.

The default cue file has this structure

```
FILE "filename" BINARY
  TRACK 01 MODE2/2352
    INDEX 01 00:00:00
```

This script hold a function, to use this function, you need to `source` the file.