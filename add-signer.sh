#!/bin/bash
_interupt() {
    echo "Shutdown ${CHILD_PIDS}"
    kill -TERM ${CHILD_PIDS}
    exit
}

trap _interupt INT TERM

GAS_PRICE=1
VERBOSITY=3
NETWORK_ID=374756
BASE_PORT=30000
BASE_RPC_PORT=8545
BASE_WS_RPC_PORT=9545

WORK_DIR=${PWD}
LOG_DIR="${WORK_DIR}/logs"
PROJECT_DIR="${WORK_DIR}/core"
FRE="${PROJECT_DIR}/build/bin/FRE"
GENESIS_FILE="${WORK_DIR}/genesis/genesis.json"

touch .pwd
mkdir -p "${LOG_DIR}"
export $(cat .env1 | xargs)

echo -e "ENODE = ${ENODE}\n"

echo -e "\nStarting the bootnode"

NODE_ID=1
  NODE_NAME="pn${NODE_ID}"
  echo -e "\nStarting the node ${NODE_ID}"

  PRIVATE_KEY="PRIVATE_KEY_${NODE_ID}"
  DATA_DIR="${WORK_DIR}/nodes/${NODE_NAME}"

  if [ ! -d "${DATA_DIR}/FRE/chaindata" ]; then
    WALLET=$(${FRE} account import --password .pwd --datadir ${DATA_DIR} <(echo ${!PRIVATE_KEY}) | awk -v FS="({|})" '{print $2}')
    ${FRE} --datadir ${DATA_DIR} init ${GENESIS_FILE}
  else
    WALLET=$(${FRE} account list --datadir ${DATA_DIR} | head -n 1 | awk -v FS="({|})" '{print $2}')
  fi

  echo "WALLET = ${WALLET}"
  echo "PRIVATE_KEY = ${!PRIVATE_KEY}" 

  PORT=$((${BASE_PORT}+${NODE_ID}))
  RPC_PORT=$((${BASE_RPC_PORT}+${NODE_ID}))
  WS_RPC_PORT=$((${BASE_WS_RPC_PORT}+${NODE_ID}))

  ${FRE} \
    --mine \
    --syncmode full \
    --enable-0x-prefix \
    --bootnodes ${ENODE} \
    --datadir ${DATA_DIR} \
    --networkid ${NETWORK_ID} \
    --verbosity ${VERBOSITY} \
    --gasprice ${GAS_PRICE} \
    --targetgaslimit 420000000 \
    --password "${WORK_DIR}/.pwd" \
    --unlock "${WALLET}" \
    --port ${PORT} \
    --rpc \
    --rpcaddr 0.0.0.0 \
    --rpcport ${RPC_PORT} \
    --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,S2Pos \
    --rpccorsdomain "*" \
    --rpcvhosts "*" \
    --ws \
    --wsaddr 0.0.0.0 \
    --wsport ${WS_RPC_PORT} \
    --wsorigins "*" \
    > "${LOG_DIR}/${NODE_NAME}-$(date +%Y%m%d-%H%M%S).log" 2>&1 &

    # gnome-terminal --title="Log Window $NODE_ID" -- bash -c "tail -f '${LOG_DIR}/${NODE_NAME}-$(date +%Y%m%d-%H%M%S).log'; exec bash"

  CHILD_PIDS="${CHILD_PIDS} $!"

echo ${CHILD_PIDS} >> "${WORK_DIR}/private-networks.pid"

echo -e "\nPIDs = ${CHILD_PIDS}\n"

