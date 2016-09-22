#!/bin/bash
. "$(dirname "$0")/functions.sh";

TARGET_NAME='pypi';
TARGET_URL="rsync://pypi.python.org/";

fetch 'rsync' "$TARGET_NAME" "$TARGET_URL";
