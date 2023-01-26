#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "helm pull"
echo "helm pull <repo>/<chart> --untar"
echo "helm pull <repo>/<chart> --untar --version <chart_version>"

echo ""
