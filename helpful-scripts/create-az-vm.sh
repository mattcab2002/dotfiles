#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if necessary environment variables are set
if [ -z "$MY_RESOURCE_GROUP_NAME" ] || [ -z "$REGION" ]; then
    echo "Error: MY_RESOURCE_GROUP_NAME or REGION is not set."
    exit 1
fi

# Check if VM-related environment variables are set
if [ -z "$MY_VM_NAME" ] || [ -z "$MY_USERNAME" ] || [ -z "$MY_VM_IMAGE" ] || [ -z "$VM_SIZE" ]; then
    echo "Error: MY_VM_NAME, MY_USERNAME, MY_VM_IMAGE, or VM_SIZE is not set."
    exit 1
fi

# Create the virtual machine
echo "Creating virtual machine..."
az vm create \
    --resource-group "$MY_RESOURCE_GROUP_NAME" \
    --name "$MY_VM_NAME" \
    --image "$MY_VM_IMAGE" \
    --admin-username "$MY_USERNAME" \
    --nic-delete-option delete \
    --os-disk-delete-option delete \
    --assign-identity \
    --generate-ssh-keys \
    --public-ip-sku Standard \
    --size "$VM_SIZE"
echo "Virtual machine created successfully."

# Enable Azure AD Login for Linux VM
echo "Enabling Azure AD Login for Linux VM..."
az vm extension set \
    --publisher Microsoft.Azure.ActiveDirectory \
    --name AADSSHLoginForLinux \
    --resource-group "$MY_RESOURCE_GROUP_NAME" \
    --vm-name "$MY_VM_NAME"
echo "Azure AD Login enabled."

# Store IP address of VM
echo "Fetching IP address of the VM..."
export IP_ADDRESS=$(az vm show --show-details --resource-group "$MY_RESOURCE_GROUP_NAME" --name "$MY_VM_NAME" --query publicIps --output tsv)

if [ -z "$IP_ADDRESS" ]; then
    echo "Error: Failed to retrieve IP address."
    exit 1
fi
echo "IP address retrieved: $IP_ADDRESS"
