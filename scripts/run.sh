
#!/bin/bash -eE

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
# shellcheck source=env.sh
. "${SCRIPT_DIR}/env.sh"

echo "INFO: R-Node startup..."

echo "INFO: NETWORK_TYPE = ${NETWORK_TYPE}"
echo "INFO: DEPLOY_TYPE = ${DEPLOY_TYPE}"
echo "INFO: CONFIGS_PATH = ${CONFIGS_PATH}"
echo "INFO: \$1 = $1"
echo "INFO: \$2 = $2"

curl -sS "https://raw.githubusercontent.com/tonlabs/rustnet.ton.dev/main/configs/ton-global.config.json" -o "${TON_NODE_CONFIGS_DIR}/ton-global.config.json"


cd "${TON_NODE_ROOT_DIR}" && "${TON_NODE_ROOT_DIR}/ton_node" --configs "${CONFIGS_PATH}" ${TON_NODE_EXTRA_ARGS} >>${TON_NODE_LOGS_DIR}/output.log 2>&1 &

echo "INFO: start TON node... DONE"

