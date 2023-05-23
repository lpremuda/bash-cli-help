#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "SSO"
echo "aws sso login [--profile default]"
echo "aws sso login --profile stg"
echo "aws sts get-caller-identity	alias: asg"
echo "export AWS_PROFILE=<profile>"
echo "unset AWS_PROFILE"

printTitle "cat ~/.aws/config"
cat ${HOME}/.aws/config

printTitle "Route53"
echo -e "aws route53 list-hosted-zones"

echo ""
