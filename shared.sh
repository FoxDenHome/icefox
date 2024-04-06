# Ensure we got a tmpfs mounted
exit_error() {
    echo "Error: $1" >&2
    exit 1
}

(mount | grep -q '^none on /mnt/keydisk type tmpfs') || exit_error 'No tmpfs mounted on /mnt/keydisk'
