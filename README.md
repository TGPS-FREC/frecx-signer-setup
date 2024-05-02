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

### Add Signer 

```shell
rm -rf nodes/
rm -rf logs/
./add-signer.sh
```

#### Stop network

```shell
./stop-reset.sh
```