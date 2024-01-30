#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "Connect to Postgres database"
echo -e "psql -h [HOST] -U [DB_USERNAME] [DATABASE]"
echo -e "\tpsql -h localhost -U prisma_user -p 5432 nestjs-kafka-app"

printTitle "Database commands:"
echo -e "${GREEN}\\l${NOCOLOR}             List databases (\\list)"
echo -e "${GREEN}\\l+${NOCOLOR}            List databases with more detail (\\list+)"
echo -e "${GREEN}\\c <DATABASE>${NOCOLOR}  Connect to/select database <DATABASE>"

printTitle "Schema commands:"
echo -e "${GREEN}\\dn${NOCOLOR}            List schemas"

printTitle "Table commands:"
echo -e "${GREEN}\dt${NOCOLOR}                    List tables from current schema"
echo -e "${GREEN}\dt *.*${NOCOLOR}                List tables from all schemas"
echo -e "${GREEN}\dt <SCHEMA>.*${NOCOLOR}         List tables from schema <SCHEMA>"
echo -e "${GREEN}DROP TABLE <TABLE>;${NOCOLOR}    Delete table <TABLE> (use quotes for mixed-case names)"
echo -e "${GREEN}SELECT * FROM <TABLE>;${NOCOLOR} Select all columns in <TABLE>"
echo -e "${GREEN}TABLE <TABLE>;${NOCOLOR}         Select all columns in <TABLE>"
echo -e "${GREEN}TRUNCATE <TABLE> [CASCADE];${NOCOLOR} Delete all entries in <TABLE> and, if CASCADE, delete relational entries in other tables"

printTitle "Sequence commands:"
echo -e "${GREEN}\ds${NOCOLOR}                       List sequences"
echo -e "${GREEN}SELECT * FROM <SEQUENCE>${NOCOLOR}  Select all columns in <SEQUENCE>"
echo -e "${GREEN}ALTER SEQUENCE <SEQUENCE> RESTART WITH <NUMBER>${NOCOLOR} Set next sequence number to <NUMBER>"

echo -e ""
