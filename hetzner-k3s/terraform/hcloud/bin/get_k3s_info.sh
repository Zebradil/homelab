#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# Extract arguments from the input into shell variables.
# jq will ensure that the values are properly quoted
# and escaped for consumption by the shell.
eval "$(jq -r '@sh "MASTER_IP=\(.ip)"')"

# Placeholder for whatever data-fetching logic your script implements
NODE_TOKEN="$(ssh -o 'StrictHostKeyChecking=no' root@${MASTER_IP} cat /var/lib/rancher/k3s/server/node-token)"

# Safely produce a JSON object containing the result value.
# jq will ensure that the value is properly quoted
# and escaped to produce a valid JSON string.
jq -n --arg token "${NODE_TOKEN}" '{"token":$token}'
