#!/bin/bash

# NOTE: THIS SCRIPT WAS TESTED WITH GOLANG 1.21 installed

set -exu
set -o pipefail

# Check if go is installed
if ! command -v go &> /dev/null; then
    echo "Error: go is not installed. Please install Go first."
    exit 1
fi

go version
frec_network_repository_url="https://github.com/TGPS-FREC/FRECX-NETWORK.git"
# Check fo version is greater than 1.21
MIN_GO_VERSION="1.21.4"  # adjust this to your requirements
GO_VERSION=$(go version | awk '{print $3}' | tr -d "go")
if [[ $(echo "$MIN_GO_VERSION $GO_VERSION" | tr " " "\n" | sort -V | head -n 1) != "$MIN_GO_VERSION" ]]; then
    echo "Error: Go version $GO_VERSION is installed, but version $MIN_GO_VERSION or higher is required."
    exit 1
fi

FREC_NETWORK_DIR=./core

rm -rf "$FREC_NETWORK_DIR" || echo "no core directory"
mkdir -p "${FREC_NETWORK_DIR}"

git clone "$frec_network_repository_url" "$FREC_NETWORK_DIR"

cp fetch.sh $FREC_NETWORK_DIR

( cd $FREC_NETWORK_DIR && bash fetch.sh )

( cd $FREC_NETWORK_DIR && make all )

