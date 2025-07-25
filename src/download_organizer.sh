#!/bin/bash

DOWNLOAD_DIR="$HOME/Downloads"
YEAR_MONTH=$(date +"%Y_%m")

DEST_DIR="$DOWNLOAD_DIR/$YEAR_MONTH"
mkdir -p "$DEST_DIR"

find "$DOWNLOAD_DIR" -maxdepth 1 -type f | while read FILE; do
  BASENAME=$(basename "$FILE")
  DEST_FILE="$DEST_DIR/$BASENAME"
  
  if [ -e "$DEST_FILE" ]; then
    COUNTER=1
    EXT="${BASENAME##*.}"
    NAME="${BASENAME%.*}"
    if [ "$NAME" = "$BASENAME" ]; then
      EXT=""
    else
      EXT=".$EXT"
    fi

    while [ -e "$DEST_DIR/${NAME}_$COUNTER$EXT" ]; do
      ((COUNTER++))
    done
    DEST_FILE="$DEST_DIR/${NAME}_$COUNTER$EXT"
  fi

  mv "$FILE" "$DEST_FILE"
done
