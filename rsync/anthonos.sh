#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='anthon';
TARGET_URL="rsync://mirror.anthonos.org/anthon";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";

push-notification "$TARGET_NAME";
