rsync --archive --links --hard-links --times --verbose --delete --recursive --exclude .~tmp~/ mirrors.ustc.edu.cn::centos/ /data/mirror/centos  >> /var/log/rsync/centos.log-$(date "+%Y-%m-%d")
