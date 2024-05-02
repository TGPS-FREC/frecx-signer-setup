#!/bin/bash

# Stop on the first error
set -e

go get github.com/FRECNET/log

go get github.com/FRECNET/common/mclock

go get github.com/FRECNET/trie

go get github.com/FRECNET/core/vm

go get github.com/FRECNET/FREx

go get github.com/FRECNET/FREx/tradingstate

go get github.com/FRECNET/ethdb/leveldb

go get github.com/FRECNET/FRExDAO

go get github.com/FRECNET/accounts/keystore

go get github.com/FRECNET/rpc

go get github.com/FRECNET/cmd/faucet

go get github.com/FRECNET/accounts/keystore

go get github.com/FRECNET/accounts/abi/bind

go get github.com/FRECNET/core/vm/privacy

go get github.com/FRECNET/crypto/blake2b

go get github.com/FRECNET/p2p/nat

go get github.com/FRECNET/p2p/discover

go get github.com/FRECNET/p2p

go get github.com/FRECNET/consensus/ethash

go get github.com/FRECNET/accounts/usbwallet

go get github.com/FRECNET/eth/tracers

go get github.com/FRECNET/console

go get github.com/FRECNET/cmd/FRE

go get github.com/FRECNET/node

go get github.com/FRECNET/internal/jsre

go get github.com/FRECNET/internal/cmdtest

go get github.com/FRECNET/p2p/simulations

go get github.com/FRECNET/cmd/puppeth

go get github.com/FRECNET/swarm/fuse

go get github.com/FRECNET/metrics/influxdb

echo "All packages fetched successfully."
