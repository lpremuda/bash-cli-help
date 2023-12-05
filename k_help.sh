#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "kubectl config"
echo -e "kubectl config get-contexts                                       alias: kcg"
echo -e "kubectl config use-context <context_name>                         alias: kcu"
echo -e "kubectl config set-context                                        alias: kcs"
echo -e "kubectl config set-context [--current] [--namespace=<namespace>]  alias: kn <namespace>"

printTitle "kubectl exec"
echo -e "kubectl exec -it <pod_name> [-c container_name] -- /bin/bash"
echo -e "kubectl exec -it deployment/<deployment_name> -- /bin/bash"

printTitle "Create Job from CronJob"
echo -e "kubectl create job --from=cronjob/[CRONJOB_NAME] [JOB_NAME]"
echo -e "\tkubectl create job --from=cronjob/nobl9-collector nobl9-collector"

printTitle "VirtualService"
echo -e "kubectl get vs -A -o jsonpath='{.items[*].spec.http[*].route[*].destination.port.number}'"

echo ""
