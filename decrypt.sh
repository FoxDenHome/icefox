#!/bin/bash
set -euo pipefail
cd /opt/icefox
source ./shared.sh

KEYNAME="$1"

/snap/bin/aws kms decrypt --key-id "$(cat /opt/icefox/key.id)" --ciphertext-blob "fileb:///opt/keys/$KEYNAME" | jq -r .Plaintext | base64 -d > "/mnt/keydisk/$KEYNAME"
