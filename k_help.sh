#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "Config"
echo "kubectl config set-context [--current] [--namespace=<namespace>]"
echo -e "\tkn <namespace>"

echo ""
