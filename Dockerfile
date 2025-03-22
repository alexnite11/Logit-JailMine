# Use a base image with necessary dependencies
FROM ubuntu:20.04

# Install curl and other necessary tools
RUN apt-get update && apt-get install -y \
    curl \
    libssl-dev \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama (from their official installer)
RUN curl -fsSL https://ollama.com/install.sh | sh

# Set Ollama environment variables
ENV PATH="/usr/local/bin:${PATH}"

# Expose Ollama API port
EXPOSE 11434

# Start Ollama service
CMD ["ollama", "serve"]
