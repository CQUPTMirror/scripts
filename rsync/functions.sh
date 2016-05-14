#!/bin/bash
detect-target() {
    local TARGET_NAME="$1";
    local LOCAL_PATH="/data/mirror/$TARGET_NAME";

    if [ ! -d "${LOCAL_PATH}" ]; then
        fatal "${LOCAL_PATH} does not exist!";
        exit -1;
    fi
}

mirror-fetch() {
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

set-permission() {
    local TARGET_NAME="$1";
    local LOCAL_PATH="/data/mirror/$TARGET_NAME";
    local LOCAL_DATE;
    LOCAL_DATE=$(date '+%Y-%m-%d');
    local LOCAL_CHMOD_LOGGER="/var/log/rsync/$TARGET_NAME-chmod-$LOCAL_DATE.log";

    chown -R www-data:www-data "$LOCAL_PATH";
    find "$LOCAL_PATH" -type d -print0 | xargs --null chmod -v 755 >> "$LOCAL_CHMOD_LOGGER";
    find "$LOCAL_PATH" -type f -print0 | xargs --null chmod -v 644 >> "$LOCAL_CHMOD_LOGGER";
}
