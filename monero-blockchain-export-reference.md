---
title: monero-blockchain-export
section: 1
date: 2022-06-30
---

# NAME

monero-blockchain-export - export monero blockchain to raw format.

# SYNOPSIS 

`./monero-blockchain-export [options]`

Example:

`./monero-blockchain-export --help`

Go to directory where you unpacked Monero, and run:

`./monero-blockchain-export --stagenet --output-file=/tmp/blockchain.raw`

# DESCRIPTION

The tool dumps local blockchain to raw format, known as the `blockchain.raw` file.

This could be useful if you want to process blockchain efficiently with your custom tools,
as the raw format is probably easier to work with than Monero's custom lmdb database.

The tool works on your local copy of the blockchain. It does not require `monerod` running.

### Help

| Option              | Description
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------
| `--help`            | Enlist available options.

### Pick network

| Option              | Description
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------
| (missing)           | By default `monero-blockchain-export` assumes [mainnet](/infrastructure/networks#mainnet).
| `--stagenet`        | Export [stagenet](/infrastructure/networks#stagenet) blockchain.
| `--testnet`         | Export [testnet](/infrastructure/networks#testnet) blockchain.

### Logging

Specifying the log file path is not supported.

| Option              | Description
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------
| `--log-level`       | `0-4` with `0` being minimal logging and `4` being full tracing. Defaults to `0`. These are general presets and do not directly map to severity levels. For example, even with minimal `0`, you may see some most important `INFO` entries. 

|| Example: `./monero-blockchain-export --log-level=1`

### Input

| Option                     | Description
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------
| `--data-dir`               | Full path to data directory. This is where the blockchain, log files, and p2p network memory are stored. For defaults and details see [data directory](/interacting/overview/#data-directory).
| `--database`, `--db-type`  | The default and only valid value is `lmdb`.

### Output

| Option              | Description
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------
| `--output-file`     | Specify output file path. The default is `$DATA_DIR/export/blockchain.raw`. 

|| Example: `./monero-blockchain-export --output-file=/tmp/blockchain.raw`
| `--blocksdat`       | Output in blocks.dat format.
| `--block-stop`      | Only export up to this block number. By default do the full export (value `0`).

# REFERENCE

* [https://github.com/monero-project/monero/tree/master/src/blockchain_utilities](https://github.com/monero-project/monero/tree/master/src/blockchain_utilities)

# SEE ALSO

Link to full documentation at: <https://monerodocs.org/interacting/monero-blockchain-export-reference/>

monero-blockchain-import(1), monerod(1), monero-wallet-cli(1), monero-wallet-rpc(1), monero-wallet-gui(1)
