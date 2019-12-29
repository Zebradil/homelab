#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

: "${1:?IP address must be specified}"

readonly IP=$1
readonly PROJ_NAME=homelab

ssh -o StrictHostKeyChecking=no root@$IP cat /etc/rancher/k3s/k3s.yaml | \
    sed -E -e "s/\b(name|cluster|user|current-context): default/\1: $PROJ_NAME/" -e "s|(server: https://)[0-9.]+(:6443)|\1$IP\2|"
