#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='archlinux';
TARGET_URL="rsync://mirror.ams1.nl.leaseweb.net/$TARGET_NAME/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";

push-notification "$TARGET_NAME";
