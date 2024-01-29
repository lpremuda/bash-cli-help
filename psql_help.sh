#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "Connect to Postgres database"
echo -e "psql -h [HOST] -U [DB_USERNAME] [DATABASE]"
echo -e "\tpsql -h localhost -U prisma_user -p 5432 nestjs-kafka-app"

printTitle "psql database commands:"
echo -e "${GREEN}\\l${NOCOLOR}             List databases (\\list)"
echo -e "${GREEN}\\l+${NOCOLOR}            List databases with more detail (\\list+)"
echo -e "${GREEN}\\c <DATABASE>${NOCOLOR}  Connect to/select database <DATABASE>"

printTitle "psql schema commands:"
echo -e "${GREEN}\\dn${NOCOLOR}            List schemas"

printTitle "psql table commands:"
echo -e "${GREEN}\\dt${NOCOLOR}            List tables from current schema"
echo -e "${GREEN}\\dt *.*${NOCOLOR}        List tables from all schemas"
echo -e "${GREEN}\\dt <SCHEMA>.*${NOCOLOR} List tables from schema <SCHEMA>"
echo -e "${GREEN}DROP TABLE <TABLE>;${NOCOLOR} Delete table <TABLE> (use quotes for mixed-case names)"
echo -e "${GREEN}SELECT * FROM <TABLE>;${NOCOLOR} Select all columns in <TABLE>"
echo -e "${GREEN}TABLE <TABLE>;${NOCOLOR} Select all columns in <TABLE>"



echo -e ""
