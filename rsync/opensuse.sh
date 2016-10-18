#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='opensuse';
TARGET_URL="rsync://rsync.opensuse.org/opensuse-full/$TARGET_NAME/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";
