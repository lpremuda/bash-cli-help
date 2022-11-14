#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "First Program"
echo "go mod init example/user/hello"
echo "go install example/user/hello"


printTitle "env"
echo -e "go env <NAME>\t\t\tGet go env var"
echo -e "go env -w <NAME>=<VALUE>\tSet go env var"
echo -e "go env -u <NAME>\t\tUnset go env var"
echo "export PATH=\$PATH:\$(dirname \$(go list -f '{{.Target}}' .))"

printTitle "help"
echo "go help <COMMAND>"

echo ""
