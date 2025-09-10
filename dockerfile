# Start from the official Ubuntu 22.04 base image
FROM ubuntu:22.04

ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG ALL_PROXY

# 将构建参数设置为环境变量
ENV http_proxy=$HTTP_PROXY \
    https_proxy=$HTTPS_PROXY \
    all_proxy=$ALL_PROXY

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary dependencies for uv and Node.js
RUN apt-get update && \
    apt-get install -y curl gnupg ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install uv using the official standalone installer
# This step downloads and installs the 'uv' executable to /usr/local/bin
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# ---

# Install Node.js 16
# Add NodeSource's GPG key
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee /usr/share/keyrings/nodesource.gpg >/dev/null

# Add the Node.js 16 repository to the sources list
RUN echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x jammy main" | tee /etc/apt/sources.list.d/nodesource.list

# Update package list with the new repository and install Node.js 16
RUN apt-get update && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

ENV HOME="/root"
ENV PATH="$HOME/.local/bin:$PATH"
# Verify the installations
RUN uv --version
RUN node -v
RUN npm -v