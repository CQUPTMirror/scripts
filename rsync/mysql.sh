#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='mysql';
TARGET_URL="rsync://ftp5.gwdg.de/pub/linux/$TARGET_NAME/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";
