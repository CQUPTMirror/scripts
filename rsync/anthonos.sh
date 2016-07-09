#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='anthonos';
TARGET_URL="rsync://mirror.anthonos.org/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";
