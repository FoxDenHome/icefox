#!/bin/bash
set -euo pipefail
set -x
cd /opt/keys
source ./shared.sh

KEYNAME="$1"

aws kms encrypt --key-id "$(cat /opt/keys/key.id)" --plaintext "fileb:///mnt/keydisk/$KEYNAME" | jq -r .CiphertextBlob | base64 -d > "/opt/keys/$KEYNAME"
