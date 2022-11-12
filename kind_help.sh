#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "kind"
echo "kind create cluster"
echo "kind get clusters"
echo "kind delete cluster [--name name]"

echo ""
