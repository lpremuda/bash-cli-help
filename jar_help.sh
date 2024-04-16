#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "List contents of .jar file:"
echo -e "jar -tf <JAR_FILE>"

printTitle "Read META-INF/MANIFEST.MF file from .jar file:"
echo -e "jar xvf <JAR_FILE> META-INF/MANIFEST.MF"
echo -e "cat META-INF/MANIFEST.MF"


echo -e ""
