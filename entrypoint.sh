#!/bin/bash

# Check if the model ID is provided
if [ -z "$MODEL_ID" ]; then
    echo "Error: MODEL_ID environment variable is not set."
    exit 1
fi

# Run the LLaMA model download command with the provided URL and model ID
llama download --source meta --model-id $MODEL_ID --meta-url $SIGNED_URL