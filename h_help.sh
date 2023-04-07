#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "helm pull"
echo "helm pull <repo>/<chart> --untar"
echo "helm pull <repo>/<chart> --untar --version <chart_version>"

printTitle "helm template"
echo "helm template external-dns ${HOME}/charts/external-dns/external-dns"

printTitle "helm install external-dns"
echo "helm install external-dns ${HOME}/charts/external-dns/external-dns --dry-run --debug"

printTitle "Debugging in helm"
echo "https://helm.sh/docs/chart_template_guide/debugging/"

echo ""
