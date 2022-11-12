#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

binaries=("aws" "docker" "eks" "git" "help" "k" "kind")

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
