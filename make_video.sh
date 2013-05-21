#!/bin/bash

export TMP_DIRECTORY="sorted"
VIDEO_FNAME="output.mp4"

echo "Removing existing $TMP_DIRECTORY"
rm -rf $TMP_DIRECTORY

echo "Creating $TMP_DIRECTORY"
mkdir $TMP_DIRECTORY

echo "Coping all ingr- files to $TMP_DIRECTORY"
ls ingr-*.png | gawk 'BEGIN{ a=1 }{ printf "cp %s ${TMP_DIRECTORY}/ingr_%04d.png\n", $0, a++ }' | bash

cd $TMP_DIRECTORY

avconv -f image2 -i ingr_%04d.png -c:v libx264 -r 10  -maxrate:v 20000k -minrate:v 16000k  -c:a n -s 1280x720 -r 10 $VIDEO_FNAME
