#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "Connect to <address> using domain.tld as the hostname and SAN:"
echo -e "curl https://domain.tld --connect-to domain.tld:443:<address>:443"
echo -e "\te.g. curl -v https://mobile-diagnostics.us01.production.procoretech.com/health --connect-to mobile-diagnostics.us01.production.procoretech.com:443:10.68.170.95:443"
echo -e "\t\tConnecting to hostname: 10.68.170.95"
echo -e "\t\tConnecting to port: 443"
echo -e "\t\tsubjectAltName: host \"mobile-diagnostics.us01.production.procoretech.com\" matched cert's \"*.us01.production.procoretech.com\""
echo -e "\t\tHost header: mobile-diagnostics.us01.production.procoretech.com"

echo -e ""
