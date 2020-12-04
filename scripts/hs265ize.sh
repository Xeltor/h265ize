#!/bin/sh
HOSTNAME="$(hostname)"

/usr/local/bin/h265ize $@ \
&& curl --header "Content-Type: application/json" \
--request POST \
--data '{"containerId": "'${HOSTNAME}'"}' \
http://172.17.0.1:5678/webhook-test/transcoder_status
