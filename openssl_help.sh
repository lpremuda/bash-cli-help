#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "Output certificate info:"
echo -e "openssl x509 -in certificate.pem -text -noout"

printTitle "Pull the SSL cert for www.instagram.com:"
echo -e "openssl s_client -connect www.instagram.com:443 -servername www.instagram.com"
echo -e "\t-servername\t\tSet TLS extension servername (SNI) in ClientHello (default)"
echo -e "\t-connect\t\tTCP/IP where to connect"

printTitle "Pull the SSL cert (and all certs in the chain) for stackexchange.com:"
echo -e "openssl s_client -showcerts -verify 5 -connect stackexchange.com:443 < /dev/null"
echo -e "\t-showcerts\t\tShow all certificates sent by server"
echo -e "\t-verify +int\t\tTurn on peer cerficiate verification"
echo -e "\t</dev/null\t\tPrevents the command from just sitting"

printTitle "Pull the SSL cert (and all certs in the chain) for Frontdoor ALB with SNI pcn.procore.com:"
echo -e "openssl s_client -showcerts -connect frontdoor-production-us01-lb-378770187.us-east-1.elb.amazonaws.com:443 -servername pcn.procore.com < /dev/null"

echo ""
