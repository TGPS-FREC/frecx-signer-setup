## FRECx-Network PoS Add Signer Instructions

## DO NOT CHANGE ANY VALUE IN genesis.json 


### Prerequisite

**Operating System**: Ubuntu 16.04 64-bit or higher

**Hardware**:

| Hardware     | Minimum | Desired |
| :----------- | :------ | :------ |
| **CPU's**:   | 2       | 4       |
| **Memory**:  | 4 GB    | 16 GB   |
| **Storage**: | 100 GB  | 500 GB  |

### Network Ports

Following network ports need to be open for the nodes to communicate

|     Port     |  Type   | Definition |
| :----------: | :-----: | :--------- |
| 30301-3030\* | TCP/UDP | Enode  |
|  8545-854\*  |   TCP   | RPC        |
|  9545-954\*  |   TCP   | WebSocket  ||

### Setup guide

### Build Dependencies

```shell
bash dependencies.sh
```

this will setup all core libraries required for FREC-Network, by compiling & setting up the environment

# Get the Enode detail from Frec Governance Team, once you are done with KYC & Staking

### Prepare .env

```
cp .env.sample .env

```

- Change ENODE to the one you got it from governance committee
- Provide your Private_Key of the wallet address that you used for "Staking"


### Add Signer 

```shell
rm -rf nodes/
rm -rf logs/
./add-signer.sh
```

- After the node is executed successfully, review the log and you will be able to start synching to the blockchain
- Each epoch is 4200 Blocks, so your node will be considered as Master Node after 2100 Block(checkpoint)
- You will start to receive your reward for mining after 2 epoch only

#### Stop network
- if you are connected to test network and if you want to stop the network.. It is very cruicial steps

```shell
./stop-reset.sh
```

#### Restart Network
- if you are connected to test network and if you want to restart with your existing state, then simply run
- do not remove nodes/ or logs/ directory (removing these directory will flush all your state and node will start fresh again)

```shell
./add-signer.sh
```
