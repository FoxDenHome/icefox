#!/bin/bash
set -euo pipefail
cd /opt/icefox
source ./shared.sh

./decrypt.sh keyfile
./decrypt.sh zfs_keyfile
./decrypt.sh restic-config.sh

cryptsetup open /dev/disk/by-uuid/6a74aa9c-4225-423b-94d3-2d7ff108dcc2 docker --key-file=/mnt/keydisk/keyfile
mount /dev/mapper/docker /var/lib/docker


zpool import -d /dev/disk/by-id -a
zdone() {
    mount --bind /mnt/ztank/local/torrent /mnt/zhdd/nas/torrent
    mount --bind /mnt/ztank/local/usenet /mnt/zhdd/nas/usenet

    exit 0
}

zfs mount -a -l && zdone
sleep 5
zfs mount -a -l && zdone
sleep 5
zfs mount -a -l && zdone
