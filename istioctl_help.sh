#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "Overview of Istio service mesh"
echo -e "istioctl proxy-status"

printTitle "Output proxy configuration for clusters, routes, listeners"
echo -e "istioctl proxy-config [clusters,routes,listeners] POD_NAME[.NAMESPACE]"
echo -e "\tistioctl proxy-config clusters istio-private-ingressgateway-green-bf56468d4-8ch5l.istio-system"

echo -e ""
echo -e "istioctl proxy-config"
echo -e "istioctl pc"

echo -e ""
