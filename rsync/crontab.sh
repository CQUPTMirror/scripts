45 6,14,22 * * * bash /data/scripts/rsync/ubuntu.sh
* */4 * * * rsync --archive --links --hard-links --times --verbose --delete --recursive --exclude .~tmp~/ rsync://ftp.tku.edu.tw/archlinux/ /data/mirror/archlinux >> /var/log/rsync/archlinux.log-$(date "+%Y-%m-%d")
* 4,12,20 * * * rsync --archive --links --hard-links --times --verbose --delete --recursive --exclude .~tmp~/ mirrors.ustc.edu.cn::archlinuxcn/ /data/mirror/archlinuxcn >> /var/log/rsync/archlinuxcn.log-$(date "+%Y-%m-%d")
* 2,10,18 * * * rsync --archive --links --hard-links --times --verbose --delete --recursive --exclude .~tmp~/ rsync://dl.fedoraproject.org/fedora-epel/ /data/mirror/epel  >> /var/log/rsync/epel.log-$(date "+%Y-%m-%d")
* 6,22 * * * rsync --archive --links --hard-links --times --verbose --delete --recursive --exclude .~tmp~/ mirrors.ustc.edu.cn::centos/ /data/mirror/centos  >> /var/log/rsync/centos.log-$(date "+%Y-%m-%d")
* 10,16 * * * rsync --archive --links --hard-links --times --verbose --delete --recursive --exclude .~tmp~/ mirrors.ustc.edu.cn::pypi/ /data/mirror/pypi >> /var/log/rsync/pypi.log-$(date "+%Y-%m-%d")
* 0 * * * rsync --archive --links --hard-links --times --verbose --delete --recursive --exclude .~tmp~/ rsync://rsync.releases.ubuntu.com/releases/ /data/mirror/ubuntu-releases >> /var/log/rsync/ubuntu-release.log-$(date "+%Y-%m-%d")
