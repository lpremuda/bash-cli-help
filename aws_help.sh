#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "SSO"
echo -e "aws sts get-caller-identity	alias: asg"

printTitle "How to Set AWS profile"
printSubtitle "Set environment variable:"
echo -e "export AWS_PROFILE=<profile>"
echo -e "unset AWS_PROFILE"
printSubtitle "Include --profile in each call (\"default\" not included):"
echo -e "aws sso login [--profile default]"
echo -e "aws sso login --profile stg"


printTitle "S3"
echo -e "aws s3 ls [S3_URI] [--recursive]"
echo -e "\taws s3 ls s3://procore-app-dlh-staging-us-east-1/external --recursive"
echo -e "aws s3 ls \"s3://<BUCKET>\" --human-readable --summarize"
printSubtitle "Download file from S3:"
echo -e "aws s3 cp s3://<BUCKET>/file /path/to/local"
printSubtitle "Upload file to S3:"
echo -e "aws s3 cp /path/to/local s3://my-bucket/path/in/bucket/file"
printSubtitle "Upload folder to S3:"
echo -e "aws s3 cp /path/to/dir s3://my-bucket/path/ --recursive"

printTitle "Route53"
echo -e "aws route53 list-hosted-zones"

printTitle "Configure"
echo -e "cat ~/.aws/config"
echo -e "$(printSubtitle 'List all profiles:') aws configure list-profiles"
echo -e "$(printSubtitle 'Show config for profile:') aws configure list --profile <profile>"

echo -e ""
