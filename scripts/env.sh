#!/bin/bash -eEx
#
#
SCRIPT_DIR=`cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P`
SRC_TOP_DIR=$(cd "${SCRIPT_DIR}/../" && pwd -P)
export SRC_TOP_DIR
export TON_NODE_ROOT_DIR="/ton-node"
export TON_NODE_CONFIGS_DIR="${TON_NODE_ROOT_DIR}/configs"
export TON_NODE_TOOLS_DIR="${TON_NODE_ROOT_DIR}/tools"
export TON_NODE_SCRIPTS_DIR="${TON_NODE_ROOT_DIR}/scripts"
export TON_NODE_LOGS_DIR="${TON_NODE_ROOT_DIR}/logs"
export TON_NODE_KEYS_DIR="${TON_NODE_CONFIGS_DIR}/keys"
export NETWORK_TYPE="rustnet.ton.dev"
export MEM_LIMIT="48G"
export CONFIGS_PATH="${TON_NODE_ROOT_DIR}/configs"
export ADNL_PORT="30303"
#export STAKE="44999"
export MSIG_ENABLE="yes"
export SDK_URL="https://rustnet.ton.dev"
export VALIDATOR_NAME="my_validator"
# Supported values: normal, bash
export NODE_CMD_1="normal"
# Supported values: validate, novalidate
export NODE_CMD_2="validate"
# ton-node command line extra arguments
export TON_NODE_EXTRA_ARGS=""
export TON_NODE_ENABLE_KAFKA="0"
export RUST_NET_ENABLE="yes"
export ELECTOR_TYPE="solidity"

