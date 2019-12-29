#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# SSH to the instance and check cloud-init status until it's done or timed-out
until (ssh -o StrictHostKeyChecking=no root@$1 cloud-init status --wait | grep -F done);
do
    sleep 5;
done
