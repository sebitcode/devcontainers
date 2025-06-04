FROM node:22-slim AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    # Development tools
    sudo git curl openssh-client nano procps wget \
    # Cleanup in same layer
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*

WORKDIR /workspaces

# Rename existing node user to sebitcode
RUN usermod -l sebitcode node \
    && groupmod -n sebitcode node \
    && usermod -d /home/sebitcode -m sebitcode \
    && chown -R sebitcode:sebitcode /workspaces /home/sebitcode

# Switch to non-root user
USER sebitcode

# Health check - using node since this is a Node.js container
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD node --version || exit 1

# Set default shell
SHELL ["/bin/bash", "-c"]