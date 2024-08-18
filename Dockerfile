# Use an official Python image as a base
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install necessary dependencies
RUN pip install --no-cache-dir llama-toolchain
RUN pip install torch fairscale fire blobfile

# Accept build arguments for MODEL_ID and SIGNED_URL
ARG MODEL_ID
ARG SIGNED_URL

# Run the LLaMA model download command during the build process
RUN llama download --source meta --model-id $MODEL_ID --meta-url $SIGNED_URL

# Copy your script or entrypoint to the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the script executable
RUN chmod +x /app/entrypoint.sh

# Run the entrypoint script by default
# CMD ["/app/entrypoint.sh"]