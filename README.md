# Rust Verusd RPC Server (Dockerize)
This repository contains a Rust library for creating a Verus RPC server. The library is designed to be simple to use, yet flexible enough to handle the needs of a variety of applications [(Forked)](https://github.com/VerusCoin/rust_verusd_rpc_server).

### Prerequisites
- [Docker and Docker Compose](https://docs.docker.com/engine/install/)

### How to configure
1. Edit Dockerfile
2. Adjust the ENVs
```sh
ENV RPC_URL "<server-public-ip>:<rpc-port>"
ENV RPC_USER "<rpc-user>"
ENV RPC_PASSWORD "<rpc-password>"
ENV SERVER_PORT "7000"
ENV SERVER_ADDR "0.0.0.0"
```

- RPC_URL: The RPC url and port. IMPORTANT NOTE: Use the public server IP rather than 0.0.0.0 / 127.0.0.1 / localhost
- RPC_USER: The RPC username
- RPC_PASSWORD: The RPC password

### Installation
```sh
$ docker-compose up -d
```

### Test
```sh
$ curl --user <rpc-user>:<rpc-password> --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": []}' -H 'content-type: text/plain;' http://0.0.0.0:7000/
```

Result:
```json
{
  "result": {
    "CCid": ...,
    "KMDnotarized_height": ...,
    "KMDversion": "...",
    "balance": ...,
    "blocks": ...,
    "connections": ...,
    "decay": "...",
    "difficulty": ...,
    "endsubsidy": "...",
    "errors": "",
    "halving": "...",
    "keypoololdest": ...,
    "keypoolsize": ...,
    "longestchain": ...,
    "magic": ...,
    "name": "...",
    "notarized": ...,
    "notarized_confirms": ...,
    "notarizedhash": "...",
    "notarizedtxid": "...",
    "notarizedtxid_height": "...",
    "notarypay": "...",
    "p2pport": ...,
    "paytxfee": ...,
    "premine": ...,
    "prevMoMheight": ...,
    "protocolversion": ...,
    "proxy": "",
    "pubkey": "...",
    "relayfee": ...,
    "reward": "...",
    "rpcport": ...,
    "sapling": ...,
    "staked": ...,
    "synced": ...,
    "testnet": ...,
    "timeoffset": ...,
    "tiptime": ...,
    "version": ...,
    "walletversion": ...
  }
}
```
