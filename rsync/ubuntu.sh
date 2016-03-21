#Ubuntu two stage sync
RSYNCSOURCE=rsync://archive.ubuntu.com/ubuntu
BASEDIR=/data/mirror/ubuntu/
rsync --recursive --verbose --times --links --hard-links \
      --stats \
      --exclude "Packages*" --exclude "Sources*" \
      --exclude "Release*" \
      ${RSYNCSOURCE} ${BASEDIR}  >> /var/log/rsync/ubuntu.log-$(date "+%Y-%m-%d")

rsync --recursive --verbose --times --links --hard-links \
      --stats --delete --delete-after \
      --exclude "project/trace/${HOSTNAME}" \
      ${RSYNCSOURCE} ${BASEDIR}  >> /var/log/rsync/ubuntu.log-$(date "+%Y-%m-%d")
