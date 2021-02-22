#!/bin/bash
export BLEND_FILE_URL=$1
export CACHE_ZIP_URL=$2

cd ../content

echo "Downloading .blend file..."
BLEND_FILE_NAME=$(wget "$BLEND_FILE_URL" --content-disposition 2>&1 | sed -n "s/Saving to: \‘\(.*\)\’/\1/p")

# If there is a second argument, processes it as a cache folder
if [ $# -eq 2 ]
then
    echo "Downloading cache zip..."
    CACHE_ZIP=$(wget "$CACHE_ZIP_URL" --content-disposition 2>&1 | sed -n "s/Saving to: \‘\(.*\)\’/\1/p")
    CACHE_DIR_NAME=${CACHE_ZIP%.*}
    unzip $CACHE_ZIP -x / -d $CACHE_DIR_NAME
    rm $CACHE_ZIP
    blender -b $BLEND_FILE_NAME -P ../scripts/overwrite-cache-dir.py -- --path "//$CACHE_DIR_NAME"
fi

blender -b $BLEND_FILE_NAME -P ../scripts/run-simulation.py