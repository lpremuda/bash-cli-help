#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "update-kubeconfig"
echo "aws eks --region us-east-1 update-kubeconfig --name us01 --alias us01"
echo "aws eks --region us-west-2 update-kubeconfig --name us02 --alias us02"
echo "aws eks --region us-east-1 update-kubeconfig --name application --alias application --profile stg"

echo ""
