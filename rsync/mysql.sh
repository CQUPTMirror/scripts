#!/bin/bash
# FIXME: This file remains unverificated.

. "$(dirname "$0")/functions.sh";

TARGET_NAME='mysql';
TARGET_URL="rsync://ftp5.gwdg.de/pub/linux/$TARGET_NAME/";

detect-target "$TARGET_NAME";
mirror-fetch "$TARGET_NAME" "$TARGET_URL";
set-permission "$TARGET_NAME";
