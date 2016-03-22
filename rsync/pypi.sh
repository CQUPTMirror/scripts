rsync --archive --links --hard-links --times --verbose --delete --recursive --exclude .~tmp~/ mirrors.ustc.edu.cn::pypi/ /data/mirror/pypi >> /var/log/rsync/pypi.log-$(date "+%Y-%m-%d")
