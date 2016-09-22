#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='ubuntu-releases';
TARGET_URL="rsync://mirror.ams1.nl.leaseweb.net/$TARGET_NAME/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";
