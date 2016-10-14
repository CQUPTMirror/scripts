#!/bin/bash
# TODO: this file is based on ubuntu offical wiki. 
# TODO: shellcheck is not applied to this file.
# Reference: https://wiki.ubuntu.com/Mirrors/Scripts 
# Ubuntu two stage sync
RSYNCSOURCE=rsync://cn.archive.ubuntu.com/ubuntu
BASEDIR=/data/mirror/ubuntu/
SYNC_DATE=$(date "+%Y-%m-%d")


if [ ! -d ${BASEDIR} ]; then
  warn "${BASEDIR} does not exist yet, trying to create it..."
  mkdir -p ${BASEDIR} || fatal "Creation of ${BASEDIR} failed."
fi

rsync --recursive --verbose --times --links --hard-links \
      --stats \
      --exclude "Packages*" --exclude "Sources*" \
      --exclude "Release*" \
      ${RSYNCSOURCE} ${BASEDIR}  >> /var/log/rsync/ubuntu.log-$SYNC_DATE

rsync --recursive --verbose --times --links --hard-links \
      --stats --delete --delete-after \
      --exclude "project/trace/${HOSTNAME}" \
      ${RSYNCSOURCE} ${BASEDIR}  >> /var/log/rsync/ubuntu.log-$SYNC_DATE;

# Send mail to mail-list
mutt -F ../configs/muttrc -s "Rsync log for ubuntu on $SYNC_DATE" \
      cqupt-mirror@googlegroups.com < /var/log/rsync/ubuntu.log-$SYNC_DATE
