#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "SSO"
echo -e "aws sso login [--profile default]"
echo -e "aws sso login --profile stg"
echo -e "aws sts get-caller-identity	alias: asg"
echo -e "export AWS_PROFILE=<profile>"
echo -e "unset AWS_PROFILE"

printTitle "S3"
echo -e "aws s3 ls [S3_URI] [--recursive]"
echo -e "\taws s3 ls s3://procore-app-dlh-staging-us-east-1/external --recursive"

printTitle "Route53"
echo -e "aws route53 list-hosted-zones"

printTitle "cat ~/.aws/config"
cat ${HOME}/.aws/config

echo -e ""
