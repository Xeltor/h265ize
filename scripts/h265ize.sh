#!/bin/bash
HOSTNAME="$(hostname)"

echo ${@:1:$#-1} "${@: -1}"

/usr/local/bin/h265ize ${@:1:$#-1} "${@: -1}" \
&& curl --header "Content-Type: application/json" \
--request POST \
--data '{"containerId": "'${HOSTNAME}'"}' \
http://172.17.0.1:5678/webhook/transcoder_status
