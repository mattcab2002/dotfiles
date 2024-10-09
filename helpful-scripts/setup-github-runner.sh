#!/usr/bin/env bash

set -e

# Check if RUNNER_TOKEN is set
if [ -z "$RUNNER_TOKEN" ]; then
    echo "Error: RUNNER_TOKEN is not set. Please set the token before running the script."
    exit 1
fi

# Create a folder for the runner
mkdir actions-runner && cd actions-runner

# Download the latest runner package
curl -o actions-runner-linux-x64-2.320.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.320.0/actions-runner-linux-x64-2.320.0.tar.gz

# Optional: Validate the hash
echo "93ac1b7ce743ee85b5d386f5c1787385ef07b3d7c728ff66ce0d3813d5f46900  actions-runner-linux-x64-2.320.0.tar.gz" | shasum -a 256 -c

# Extract the installer
tar xzf ./actions-runner-linux-x64-2.320.0.tar.gz

# Create the runner and start the configuration experience
./config.sh --url https://github.com/Devpro-Software --token "$RUNNER_TOKEN"

# Last step, run it!
nohup ./run.sh &
