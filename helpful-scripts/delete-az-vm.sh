#!/usr/bin/env bash

set -e

# Check if MY_RESOURCE_GROUP_NAME and MY_VM_NAME are set
if [ -z "$MY_RESOURCE_GROUP_NAME" ] || [ -z "$MY_VM_NAME" ]; then
    echo "Error: MY_RESOURCE_GROUP_NAME or MY_VM_NAME is not set."
    exit 1
fi

# Delete the VM
echo "Deleting VM $MY_VM_NAME in resource group $MY_RESOURCE_GROUP_NAME..."
az vm delete \
    --resource-group "$MY_RESOURCE_GROUP_NAME" \
    --name "$MY_VM_NAME" \
    --force-deletion none \
    --yes

echo "VM $MY_VM_NAME deleted successfully."
