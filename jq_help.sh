#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

echo -e ""

echo -e "Cheatsheet: ${GREEN}https://gist.github.com/olih/f7437fb6962fb3ee9fe95bda8d2c8fa4${NOCOLOR}"
echo -e "Cheatsheet: ${GREEN}https://lzone.de/cheat-sheet/jq${NOCOLOR}"

printTitle "Example JSON object and jq commands"

json=$(cat << EOF
{
	"timestamp": 1234567890,
	"report": "Age Report",
	"results": [
		{ "name": "John", "age": 43, "city": "TownA" },
		{ "name": "Joe",  "age": 10, "city": "TownB" }
	]
}
EOF
)
echo -e "$json"

echo -e ""

echo -e "jq '. | {timestamp,report}'"
echo -e "jq '.results[] | {name,age}'"
echo -e "jq -r '.results[] | {name, age} | join(\" \")'"

printTitle "Count number of elements in JSON array:"
echo -e "jq length"
echo -e "jq '[QUERY] | length'"
echo -e "\tjq '.[1].metadata.labels.owner | length'"

printTitle "Remove quotes from strings (output raw strings):"
echo -e "jq -r [REST_OF_ARGUMENTS]"

printTitle "Parse JSON string:"
echo -e "echo \"[{\\\"type\\\":\\\"RETIRING_PRO\\\"}]\" | jq"

echo -e ""
