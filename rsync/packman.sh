#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='packman';
TARGET_URL="rsync://packman.inode.at/$TARGET_NAME/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";
