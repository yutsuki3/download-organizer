#!/bin/bash

# ダウンロードフォルダのパス
DOWNLOAD_DIR="$HOME/Downloads"

# 現在の年と月を取得
YEAR_MONTH=$(date +"%Y_%m")

# 移動先のフォルダを作成（存在しなければ）
DEST_DIR="$DOWNLOAD_DIR/$YEAR_MONTH"
mkdir -p "$DEST_DIR"

# ダウンロードフォルダ内の全ファイルを処理
find "$DOWNLOAD_DIR" -maxdepth 1 -type f | while read FILE; do
  BASENAME=$(basename "$FILE")
  DEST_FILE="$DEST_DIR/$BASENAME"
  
  # 同名ファイルが存在する場合、ファイル名を変更
  if [ -e "$DEST_FILE" ]; then
    COUNTER=1
    EXT="${BASENAME##*.}"
    NAME="${BASENAME%.*}"
    # 拡張子なしファイル対応
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
