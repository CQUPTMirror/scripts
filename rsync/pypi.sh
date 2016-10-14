#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='pypi';
TARGET_URL="rsync://pypi.douban.com/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";

push-notification "$TARGET_NAME";
