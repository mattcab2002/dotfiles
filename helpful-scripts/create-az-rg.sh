#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if necessary environment variables are set
if [ -z "$MY_RESOURCE_GROUP_NAME" ] || [ -z "$REGION" ]; then
    echo "Error: MY_RESOURCE_GROUP_NAME or REGION is not set."
    exit 1
fi

# Create a resource group
echo "Creating resource group..."
az group create --name "$MY_RESOURCE_GROUP_NAME" --location "$REGION"
echo "Resource group created successfully."
