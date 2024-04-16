#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

binaries=("aws" "curl" "docker" "eks" "git" "go" "h" "help" "istioctl" "jar" "jq" "k" "kind" "lsof" "npm" "openssl" "psql" "sed" "t")

printTitle "Change directory to source code directory:"
echo "cdch (cd into cli help)"

printTitle "Supported binaries:"
for binary in ${binaries[@]}; do
	echo "${binary}h"
done

printTitle "Binaries locations:"
for binary in ${binaries[@]}; do
	echo "${SCRIPT_DIR}/${binary}h"
done

printTitle "Shell script locations:"
for binary in ${binaries[@]}; do
	echo "${SCRIPT_DIR}/${binary}_help.sh"
done

printTitle "How to create symbolic link example":
echo "ln -s ~/.local/share/help/help_help.sh ~/.local/bin/helph"

echo ""
