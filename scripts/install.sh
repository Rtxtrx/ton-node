#!/bin/bash -eEx
#
#
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
export SCRIPT_DIR
SRC_TOP_DIR=$(cd "${SCRIPT_DIR}/../" && pwd -P)
export SRC_TOP_DIR
export RUST_BUILD_DIR="${SRC_TOP_DIR}"
export ENABLE_VALIDATE="yes"
export CLEAN_HOST=${CLEAN_HOST:-yes}
export COMPOSE_HTTP_TIMEOUT=120 # in sec, 60 sec - default
HOSTNAME=$(hostname -f)
#export TON_NODE_GITHUB_REPO="git@github.com:tonlabs/ton-labs-node.git"
export TON_NODE_GITHUB_REPO="https://github.com/tonlabs/ton-labs-node.git"
export TON_NODE_GITHUB_COMMIT_ID="master"
#export TON_NODE_TOOLS_GITHUB_REPO="git@github.com:tonlabs/ton-labs-node-tools.git"
export TON_NODE_TOOLS_GITHUB_REPO="https://github.com/tonlabs/ton-labs-node-tools.git"
export TON_NODE_TOOLS_GITHUB_COMMIT_ID="master"
#export TONOS_CLI_GITHUB_REPO="git@github.com:tonlabs/tonos-cli.git"
export TONOS_CLI_GITHUB_REPO="https://github.com/tonlabs/tonos-cli.git"
export TONOS_CLI_GITHUB_COMMIT_ID="master"

#apt-get update && apt-get install -y \
#    gpg \
#    tar \
#    cmake \
#    build-essential \
#    pkg-config \
#    libssl-dev \
#    libtool \
#    m4 \
#    automake \
#    clang \
#    git


mkdir -p "${RUST_BUILD_DIR}/ton-node/build"
rm -rf "${RUST_BUILD_DIR}/ton-node/build/ton-node"
cd "${RUST_BUILD_DIR}/ton-node/build" && git clone --recursive "${TON_NODE_GITHUB_REPO}" ton-node
cd "${RUST_BUILD_DIR}/ton-node/build/ton-node" && git checkout "${TON_NODE_GITHUB_COMMIT_ID}" && cargo build --release

cd "${RUST_BUILD_DIR}/ton-node/build/ton-node" && git clone --recursive "${TON_NODE_TOOLS_GITHUB_REPO}"
cd "${RUST_BUILD_DIR}/ton-node/build/ton-node/ton-labs-node-tools" && git checkout "${TON_NODE_TOOLS_GITHUB_COMMIT_ID}" && cargo build --release

rm -rf "${DRUST_BUILD_DIR}/ton-node/build/tonos-cli"
cd "${RUST_BUILD_DIR}/ton-node/build" && git clone --recursive "${TONOS_CLI_GITHUB_REPO}"
cd "${RUST_BUILD_DIR}/ton-node/build/tonos-cli" && git checkout "${TONOS_CLI_GITHUB_COMMIT_ID}" && cargo build --release

mkdir -p ${RUST_BUILD_DIR}/tools
#mkdir -p ${RUST_BUILD_DIR}/configs
mkdir -p ${RUST_BUILD_DIR}/logs
cp ${RUST_BUILD_DIR}/ton-node/build/ton-node/target/release/ton_node ${RUST_BUILD_DIR}/ton_node
cp ${RUST_BUILD_DIR}/ton-node/build/ton-node/ton-labs-node-tools/target/release/console ${RUST_BUILD_DIR}/tools/console
cp ${RUST_BUILD_DIR}/ton-node/build/ton-node/ton-labs-node-tools/target/release/keygen ${RUST_BUILD_DIR}/tools/keygen
cp ${RUST_BUILD_DIR}/ton-node/build/tonos-cli/target/release/tonos-cli ${RUST_BUILD_DIR}/tools/tonos-cli

