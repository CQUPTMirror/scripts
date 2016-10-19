#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='opensuse';
TARGET_URL="rsync://rsync.opensuse.org/opensuse-full/$TARGET_NAME/";
TARGET_EXC="$(dirname "$0")/exclude_opensuse.list"

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL" "$TARGET_EXC";

push-notification "$TARGET_NAME";
