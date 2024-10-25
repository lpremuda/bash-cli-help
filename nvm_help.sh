#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "nvm"
echo "nvm current"
echo "nvm ls"
echo "nvm use 14 (nvm use lts/fermium)"
echo "nvm use 18 (nvm use lts/hydrogen)"
echo "nvm use 20 (nvm use lts/iron)"

echo ""
