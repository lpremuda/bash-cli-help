#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "Get current branch name:"
echo "git rev-parse --abbrev-ref HEAD"

printTitle "Tag"
echo "git fetch --all --tags"
echo "git checkout tags/<tag>"
echo -e "e.g. git checkout tags/v1.62.0"
echo "git tag"

printTitle "Log"
echo "git log --oneline"
echo "git log --stat"
echo "git log --patch (-p)"
echo "git log <commit SHA>"
echo "git log --graph"
echo "git log --graph --oneline"

echo ""
