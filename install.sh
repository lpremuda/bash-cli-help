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

ALIAS_FILENAME="cli_help_aliases.zsh"
ALIAS_FILENAME_BAK="${ALIAS_FILENAME}.bak"
echoCurrStep "Moving ${ALIAS_FILENAME} to ${HOME}/.oh-my-zsh/custom"
if [[ -f ${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME} ]]; then
	echo -e "${YELLOW}${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME} already exists. Creating backup file: ${ALIAS_FILENAME_BAK}${NOCOLOR}" 
	mv ${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME} ${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME_BAK}
	echo -e "\t${GREEN}Backing up ${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME} complete!${NOCOLOR}\n"
fi
echo -e "Moving ${ALIAS_FILENAME} to ${HOME}/.oh-my-zsh/custom\n"	
mv ${ALIAS_FILENAME} ${HOME}/.oh-my-zsh/custom
echo "Done!"

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
echo "Checking if ${SCRIPT_DIR} is already on PATH"
if [[ ":$PATH:" == *":${SCRIPT_DIR}:"* ]]; then
	# Directory is already on PATH
	echo -e "\t${GREEN}${SCRIPT_DIR} is already on the PATH. Skipping...${NOCOLOR}"
else
	# Directory is not on PATH yet
	echo -e "\t${YELLOW}${SCRIPT_DIR} is not on the PATH yet.${NOCOLOR}"

	echo -e "\nAdding ${SCRIPT_DIR} to PATH"

	# Added line to .zshrc file
	echo "export PATH=${SCRIPT_DIR}:\$PATH" >> ${HOME}/.zshrc
	
	# Cannot use 'source ${HOME}/.zshrc' inside bash script
	# SHELL should equal /bin/zsh
	# This will run implicitly run the ${HOME}/.zshrc file
	# Ended up commenting out this command because it seems to start an entirely new zsh shell and stop the execution of this bash script. Will just ask the user to call the 'source ${HOME}/.zshrc manually.
	# exec ${SHELL}
	echo -e "\t${GREEN}Added ${SCRIPT_DIR} to PATH${NOCOLOR}"
	echo -e "\n${RED}USER ATTENTION REQUIRED: Enter in the command 'source \${HOME}/.zshrc' or open a new terminal session.${NOCOLOR}"
fi

echo -e ""
