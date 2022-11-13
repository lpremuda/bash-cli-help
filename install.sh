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
		echo -e "\t${YELLOW}${sym_link_basename} already exists. Skipping...${NOCOLOR}"
	else
		ln -s ${sh_absolute_path} ${sym_link_basename}	
		echo -e "\t${GREEN}${sym_link_basename} symbolic link created!${NO_COLOR}"
	fi
done

echoCurrStep "Adding ${SCRIPT_DIR} to PATH env variable"
echo "Checking if ${SCRIPT_DIR} is already on \$PATH"
if [[ ":$PATH:" == *":${SCRIPT_DIR}:"* ]]; then
	# Directory is already on PATH
	echo -e "\t${GREEN}${SCRIPT_DIR} is already on the PATH. Skipping...${NOCOLOR}"
else
	# Directory is not on PATH yet
	echo -e "\t${YELLOW}${SCRIPT_DIR} is not on the PATH yet.${NOCOLOR}"

	echo "Adding ${SCRIPT_DIR} to \$PATH"

	# Added line to .zshrc file
	echo "export PATH=${SCRIPT_DIR}:\$PATH" >> ${HOME}/.zshrc
	# source ${HOME}/.zshrc
	echo -e "\t${GREEN}Added ${SCRIPT_DIR} to \$PATH${NOCOLOR}"
fi

echo ""
