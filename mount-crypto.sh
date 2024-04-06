#!/bin/bash
set -euo pipefail
cd /opt/icefox
source ./shared.sh

./decrypt.sh keyfile
./decrypt.sh zfs_keyfile

cryptsetup open /dev/disk/by-uuid/c2b33a7d-8c06-42da-9928-98667f16c6c9 docker --key-file=/mnt/keydisk/keyfile
mount /dev/mapper/docker /var/lib/docker

zdone() {
    exit 0
}

zfs mount -a -l && zdone
sleep 5
zfs mount -a -l && zdone
sleep 5
zfs mount -a -l && zdone
