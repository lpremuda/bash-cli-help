#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
chmod +x ${SCRIPT_DIR}/shared/load_shared_resources.sh
source ${SCRIPT_DIR}/shared/load_shared_resources.sh

# ----------------------------------
# Function to output current action
# Usage: echoCurrStep <step name>
# ----------------------------------
function echoCurrStep() {
    echo -e "\n${ORANGE}====> ${NOCOLOR} $1 \n"
    sleep 1
}

for sh_absolute_path in $(ls ${SCRIPT_DIR}/*_help.sh); do
	sh_basename=$(basename $sh_absolute_path)
	echoCurrStep "Processing shell script: $sh_basename"
	echo -e "Making ${sh_basename} executable"
	chmod +x ${SCRIPT_DIR}/${sh_basename}
	echo -e "\t${GREEN}${sh_basename} is executable!${NOCOLOR}\n"

	arr=(${sh_basename//_/ })
	binary=${arr[0]}
	sym_link_basename=${binary}h
	echo "Creating symbolic link: ${sym_link_basename}"
	if [ -f ${SCRIPT_DIR}/${sym_link_basename} ]; then
		echo -e "\t${YELLOW}${sym_link_basename} already exists.${NOCOLOR}"
	else
		ln -s ${sh_absolute_path} ${sym_link_basename}	
		echo -e "\t${GREEN}${sym_link_basename} symbolic link created!${NO_COLOR}"
	fi
done

echo ""
