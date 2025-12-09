#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "List installed JVM versions"
echo -e "/usr/libexec/java_home -V"

printTitle "Set JVM version (example):"
echo -e "export JAVA_HOME=\"/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home\";"


echo -e ""
