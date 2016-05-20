#!/usr/bin/env bash

set -e

# Download CLI source or release from github into assets directory
rm -rf blobs/s3cli
mkdir blobs/s3cli
current_version=0.0.31
curl -L -o blobs/s3cli/s3cli https://s3.amazonaws.com/s3cli-artifacts/s3cli-${current_version}-linux-amd64
echo "32130fe8d775c33695dc83ec21ae41c97d804023 blobs/s3cli/s3cli" | sha1sum -c -
