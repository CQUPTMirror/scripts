#!/bin/sh
. "$(dirname "$0")/functions.sh";

TARGET_NAME='lxc-images';
TARGET_URL="rsync://mirror.tuna.tsinghua.edu.cn/$TARGET_NAME/";

detect-target "$TARGET_NAME";
mirror-fetch "$TARGET_NAME" "$TARGET_URL";
set-permission "$TARGET_NAME";
