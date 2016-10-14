#!/bin/bash
## This file defines functions that is used in a sync process.

## This function detects whether the target directory exists. If not, it will exit with an error code -1.
## Usage: detect-target $TARGET_NAME;
detect-target() {
    local TARGET_NAME="$1";
    local LOCAL_PATH="/data/mirror/$TARGET_NAME";

    if [ ! -d "${LOCAL_PATH}" ]; then
        fatal "${LOCAL_PATH} does not exist!";
        exit -1;
    fi
}

## This function do the actual process with rsync protocol.
## Usage: mirror-fetch-with-rsync $TARGET_NAME $TARGET_URL
mirror-fetch-with-rsync() {
    local TARGET_NAME="$1";
    local TARGET_URL="$2";
    local LOCAL_DATE;
    LOCAL_DATE=$(date '+%Y-%m-%d');
    local LOCAL_PATH="/data/mirror/$TARGET_NAME";
    local LOCAL_RSYNC_LOGGER="/var/log/rsync/$TARGET_NAME-rsync-$LOCAL_DATE.log";

    rsync \
        --archive \
        --no-o \
        --links \
        --hard-links \
        --times \
        --verbose \
        --delete \
        --recursive \
        --exclude \
        .~tmp~/ \
        --delete-excluded \
        "$TARGET_URL" \
        "$LOCAL_PATH" \
        >> "$LOCAL_RSYNC_LOGGER"; 
}

## This function sets permission of all files and directories in the certain path with 755 for directories and 644 for files.
## Usage: set-permission $TARGET_NAME 
set-permission() {
    local TARGET_NAME="$1";
    local LOCAL_PATH="/data/mirror/$TARGET_NAME";
    local LOCAL_DATE;
    LOCAL_DATE=$(date '+%Y-%m-%d');
    # chperm is short for change permission.
    local LOCAL_CHMOD_LOGGER="/var/log/rsync/$TARGET_NAME-chperm-$LOCAL_DATE.log";

    chown -R -c www-data:www-data "$LOCAL_PATH" >> "$LOCAL_CHMOD_LOGGER";
    find "$LOCAL_PATH" -type d -print0 | xargs --null chmod -c 755 >> "$LOCAL_CHMOD_LOGGER";
    find "$LOCAL_PATH" -type f -print0 | xargs --null chmod -c 644 >> "$LOCAL_CHMOD_LOGGER";
}

## This function does a full process of sync. 
## Usage: fetch $METHOD $TARGET_NAME $TARGET_URL
fetch() {
    local TYPE="$1";
    local TARGET_NAME="$2";
    local TARGET_URL="$3";

    detect-target "$TARGET_NAME";
    case "$TYPE" in
        rsync)
            mirror-fetch-with-rsync "$TARGET_NAME" "$TARGET_URL";
            ;;
    esac
    set-permission "$TARGET_NAME";
}

## This function sends an email to the mail-list cqupt-mirror@googlegroups.com
## Usage: push-notification $TARGET_NAME
push-notification() {
    local TARGET_NAME="$1"
    local LOCAL_DATE;
    LOCAL_DATE=$(date '+%Y-%m-%d');
    mutt -F ../configs/muttrc -s "Rsync log for $TARGET_NAME on $LOCAL_DATE" cqupt-mirror@googlegroups.com < /var/log/rsync/$TARGET_NAME-rsync-$LOCAL_DATE.log
}
