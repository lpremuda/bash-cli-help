#!/bin/bash

ALIAS_FILENAME="cli_help_aliases.zsh"
ALIAS_FILENAME_BAK="${ALIAS_FILENAME}.bak"
ALIAS_FILENAME_COPY="${ALIAS_FILENAME}.copy"

# Copy alias file to maintain original values, so that 'git status' doesn't change when running an installation
cp ${ALIAS_FILENAME} ${ALIAS_FILENAME_COPY}

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

echo -e -n "\n" >> ${ALIAS_FILENAME}

function moveAliasFile() {
	echoCurrStep "Copying ${ALIAS_FILENAME} to ${HOME}/.oh-my-zsh/custom"
	if [[ -f ${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME} ]]; then
		echo -e "${YELLOW}${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME} already exists. Creating backup file: ${ALIAS_FILENAME_BAK}${NOCOLOR}" 
		mv ${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME} ${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME_BAK}
		echo -e "\t${GREEN}Backing up ${HOME}/.oh-my-zsh/custom/${ALIAS_FILENAME} complete!${NOCOLOR}\n"
	fi
	echo -e "Copying ${ALIAS_FILENAME} to ${HOME}/.oh-my-zsh/custom\n"	
	cp ${SCRIPT_DIR}/${ALIAS_FILENAME} ${HOME}/.oh-my-zsh/custom

	# Copy original alias file back and remove the copy
	mv ${ALIAS_FILENAME_COPY} ${ALIAS_FILENAME}
	echo "Done!"
}

for sh_absolute_path in $(ls ${SCRIPT_DIR}/*_help.sh); do
	# Get basename from absolute path
	sh_basename=$(basename $sh_absolute_path)
	echoCurrStep "Processing shell script: $sh_basename"

	# Make shell script executable
	echo -e "Making ${sh_basename} executable"
	chmod +x ${SCRIPT_DIR}/${sh_basename}
	echo -e "\t${GREEN}${sh_basename} is executable!${NOCOLOR}\n"

	# Create symbolic link
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

	# Create alias to edit shell script in ${ALIAS_FILENAME}
	edit_alias_name="${sym_link_basename}e"
	echo "alias ${edit_alias_name}='nvim \${CLI_HELP_DIR}/${sh_basename}'" >> ${ALIAS_FILENAME}
done

echo -e -n "\n" >> ${ALIAS_FILENAME}

moveAliasFile

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

echoCurrStep "Adding CLI_HELP_DIR env variable to ${HOME}/.zshrc file"
if [[ $(cat ${HOME}/.zshrc | grep "export CLI_HELP_DIR") == "" ]]; then
	echo "export CLI_HELP_DIR=${SCRIPT_DIR}" >> ${HOME}/.zshrc
fi
echo "Done!"

echo ""
