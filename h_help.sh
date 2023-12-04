#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "helm pull"
echo -e "helm pull [REPO]/[CHART] --untar"
echo -e "helm pull [REPO]/[CHART] --untar --version [CHART_VERSION]"
echo -e "\thelm pull istio/gateway --untar --version 1.16.3"
echo -e "\thelm pull external-dns/external-dns --untar --version 1.12.1"

printTitle "List released charts in all namespaces:"
echo -e "helm list -A"

printTitle "Get the manifest of released chart:"
echo -e "helm get manifest [RELEASE_NAME] -n [NAMESPACE]"
echo -e "\thelm get manifest aws-load-balancer-controller -n kube-system"
echo -e "helm get all [RELEASE_NAME] -n [NAMESPACE]"

printTitle "Get Values object of released charts:"
echo -e "helm get values [RELEASE_NAME]"

printTitle "List all versions for a given [REPO]/[CHART]:"
echo -e "helm search repo -l | grep \"[REPO]\/[CHART]\""

printTitle "Render a helm chart with values:"
echo -e "helm template [RELEASE_NAME] [CHART]"
echo -e "\thelm template external-dns ${HOME}/charts/external-dns/external-dns"
echo -e "helm install [RELEASE_NAME] [CHART] --dry-run --debug"
echo -e "\thelm install external-dns ${HOME}/charts/external-dns/external-dns --dry-run --debug"

printTitle "Update dependencies in charts/ folder with configuration that matches Chart.yaml:"
echo -e "helm dependency update"
echo -e "tar -xvzf [PATH_TO_FILE]"

printTitle "Debugging in helm"
echo -e "https://helm.sh/docs/chart_template_guide/debugging/"

echo -e ""
