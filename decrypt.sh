#!/bin/bash
set -euo pipefail
set -x
cd /opt/keys
source ./shared.sh

KEYNAME="$1"

aws kms decrypt --key-id "$(cat /opt/keys/key.id)" --ciphertext-blob "fileb:///opt/keys/$KEYNAME" | jq -r .Plaintext | base64 -d > "/mnt/keydisk/$KEYNAME"
