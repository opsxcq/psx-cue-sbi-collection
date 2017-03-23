#!/bin/bash

function cue-gen() {

rm *.m3u

### BIN

for f in *.bin
do
if [ ! -f "$f" ];
then
  continue;
fi

cue=$(echo "$f" | sed 's/\.bin/\.cue/g')
cat > "$cue" << EOF
FILE "$f" BINARY
  TRACK 01 MODE2/2352
    INDEX 01 00:00:00
EOF
name=$(basename "$(pwd)")
echo "$cue" >> "$name".m3u
done

#### ISO 

for f in *.iso
do
if [ ! -f "$f" ];
then
  continue;
fi

cue=$(echo "$f" | sed 's/\.iso/\.cue/g')
cat > "$cue" << EOF
FILE "$f" BINARY
  TRACK 01 MODE2/2352
    INDEX 01 00:00:00
EOF
name=$(basename "$(pwd)")
echo "$cue" >> "$name".m3u
done

#### IMG

for f in *.img
do
if [ ! -f "$f" ];
then
  continue;
fi

cue=$(echo "$f" | sed 's/\.img/\.cue/g')
cat > "$cue" << EOF
FILE "$f" BINARY
  TRACK 01 MODE2/2352
    INDEX 01 00:00:00
EOF
name=$(basename "$(pwd)")
echo "$cue" >> "$name".m3u
done


}
