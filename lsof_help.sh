#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "List all internet files:"
echo -e "lsof -i"

printTitle "Check if <port_number> is open on device"
echo -e "lsof -i:<port_number>"

echo ""
