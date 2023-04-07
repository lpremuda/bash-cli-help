#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "kubectl config"
echo "kubectl config get-contexts"
echo -e "\talias: kcg"
echo "kubectl config use-context [context_name]"
echo "kubectl config set-context ..."
echo -e "\talias: kcs ..."
echo "kubectl config set-context [--current] [--namespace=<namespace>]"
echo -e "\talias: kn <namespace>"

printTitle "kubectl exec"
echo "kubectl exec -it <pod_name> [-c container_name] -- /bin/bash"
echo "kubectl exec -it deployment/<deployment_name> -- /bin/bash"


echo ""
