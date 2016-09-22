#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='ubuntu-releases';
TARGET_URL="rsync://mirrors.aliyun.com/$TARGET_NAME/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";
