#!/bin/bash
set -e

AGENT_SPEC="$1"
RAY_ADDRESS="ray-head:10001"

OWN_IP=$(hostname -i)


# Make sure RAY_ADDRESS is set
if [[ -z "$RAY_ADDRESS" ]]; then
  echo "Error: RAY_ADDRESS environment variable not set"
  exit 1
fi

# Explicitly start Ray in client mode, connecting to the head node
ray start --address=$RAY_ADDRESS --node-ip-address=$OWN_IP

echo "Waiting for Ray head to be ready..."
for i in {1..60}; do
  if ray status > /dev/null 2>&1; then
    echo "Ray head is ready!"
    break
  fi
  echo "Attempt $i/60: Ray head not ready yet, waiting..."
  sleep 2
done

if ! ray status > /dev/null 2>&1; then
  echo "Error: Ray head failed to start within the allocated time"
  exit 1
fi


if [[ -z "$AGENT_SPEC" ]]; then
  echo "Error: AGENT_SPEC argument not provided"
  exit 1
fi

if [[ "$AGENT_SPEC" == local ]]; then
  echo "Using local agent version..."
  cd /serve_app
  pip install -e .
else
  # Parse AGENT_SPEC from format like example-agent@0.0.1 to example-agent==0.0.1
  if [[ "$AGENT_SPEC" == *"@"* ]]; then
    PACKAGE_NAME=$(echo "$AGENT_SPEC" | cut -d '@' -f 1)
    VERSION=$(echo "$AGENT_SPEC" | cut -d '@' -f 2)
    AGENT_SPEC="${PACKAGE_NAME}==${VERSION}"
  fi
  
  echo "Installing $AGENT_SPEC..."
  pip install --extra-index-url https://agents.pypi.pntheon.ai/simple/ "$AGENT_SPEC"
fi

echo "Starting Ray Serve directly..."

exec serve run --address="$RAY_ADDRESS" entrypoint:app