#!/bin/sh

runx() {
    export CMD="$1"
    shift 1
    "$CMD" "$@"
}

export RESTIC_REPOSITORY='s3:s3.us-west-001.backblazeb2.com/icefox-backups'
runx "$@"

export RESTIC_REPOSITORY='/mnt/ztank/local/restic'
runx "$@"
