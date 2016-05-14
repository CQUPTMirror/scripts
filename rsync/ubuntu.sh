#!/bin/bash
# TODO: this file is based on ubuntu offical wiki. 
# TODO: shellcheck is not applied to this file.
# Reference: https://wiki.ubuntu.com/Mirrors/Scripts 
# Ubuntu two stage sync
RSYNCSOURCE=rsync://archive.ubuntu.com/ubuntu
BASEDIR=/data/mirror/ubuntu/

if [ ! -d ${BASEDIR} ]; then
  warn "${BASEDIR} does not exist yet, trying to create it..."
  mkdir -p ${BASEDIR} || fatal "Creation of ${BASEDIR} failed."
fi

rsync --recursive --verbose --times --links --hard-links \
      --stats \
      --exclude "Packages*" --exclude "Sources*" \
      --exclude "Release*" \
      ${RSYNCSOURCE} ${BASEDIR}  >> /var/log/rsync/ubuntu.log-$(date "+%Y-%m-%d")

rsync --recursive --verbose --times --links --hard-links \
      --stats --delete --delete-after \
      --exclude "project/trace/${HOSTNAME}" \
      ${RSYNCSOURCE} ${BASEDIR}  >> /var/log/rsync/ubuntu.log-$(date "+%Y-%m-%d")
