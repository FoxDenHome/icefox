#!/bin/bash
set -euo pipefail
cd /opt/icefox
source ./shared.sh

KEYNAME="$1"

mkdir -p /opt/keys

aws kms encrypt --key-id "$(cat /opt/icefox/key.id)" --plaintext "fileb:///mnt/keydisk/$KEYNAME" | jq -r .CiphertextBlob | base64 -d > "/opt/keys/$KEYNAME"
