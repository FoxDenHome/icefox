#!/bin/sh

runx() {
    export REPO="$1"
    export CMD="$2"
    shift 2
    "$CMD" "$@"
}

runx 's3:s3.us-west-001.backblazeb2.com/icefox-backups' "$@"
runx '/mnt/ztank/local/restic' "$@"
