#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='lxc-images';
TARGET_URL="rsync://mirror.tuna.tsinghua.edu.cn/$TARGET_NAME/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";
