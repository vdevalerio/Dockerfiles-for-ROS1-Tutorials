FROM ubuntu:focal

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set user and its password
ARG USER="user"
ARG PASSWORD="password"

# Install required packages
RUN apt update && \
    apt install -y \
    sudo \
    lsb-release \
    vim \
    nano \
    curl \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user with a home directory
RUN useradd -m -s /bin/bash ${USER}

# Set a password for user (e.g., "password")
RUN echo "${USER}:${PASSWORD}" | chpasswd

# Add user to sudoers
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/{$USER} && \
    chmod 0440 /etc/sudoers.d/{$USER}

USER ${USER}

WORKDIR /workspace

CMD ["/bin/bash"]