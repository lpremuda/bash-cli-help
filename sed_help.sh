#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

echo -e ""

echo -e "Cheatsheet: ${GREEN}https://quickref.me/sed.html${NOCOLOR}"

printTitle "Print out first line and all lines match 'string'"
echo -e "COMMAND | sed -n '1p; /string/p'"

printTitle "Printing lines:"
echo -e "sed -n '1,4p' input.txt          Print lines 1-4"
echo -e "sed -n '1,4d' input.txt          Print all lines, except 1-4"
echo -e "sed -n '1,4p; 6,7p' input.txt    Print lines 1-4 and 6-7"

printTitle "Inputting text:"
echo -e "sed -n [-i] COMMAND TEXT_FILE    -i in-place file editting"
echo -e "echo TEXT | sed -n COMMAND"
echo -e "sed -n COMMAND <<< TEXT"

echo -e ""
