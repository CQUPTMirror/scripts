#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='archlinuxcn';
TARGET_URL="rsync://repo.archlinuxcn.org/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";

push-notification "$TARGET_NAME";
