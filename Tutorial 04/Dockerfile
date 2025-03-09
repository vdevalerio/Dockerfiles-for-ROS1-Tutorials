FROM osrf/ros:noetic-desktop-full-focal

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set user and its password (this is not a good practice and will trigger a warning)
ARG USER="user"
ARG PASSWORD="password"

# Install required packages
RUN apt update && apt install -y \
    sudo \
    lsb-release \
    vim \
    nano \
    curl \
    gnupg2 \
    # Dependencies for building packages
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    python3-catkin-tools \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep if it's not already initialized
RUN rosdep update

# Create a non-root user with a home directory
RUN useradd -m -s /bin/bash ${USER}

# Set a password for user (e.g., "password")
RUN echo "${USER}:${PASSWORD}" | chpasswd

# Add user to sudoers
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/{$USER} && \
    chmod 0440 /etc/sudoers.d/{$USER}

# Set up the workspace
RUN mkdir -p /home/${USER}/catkin_ws/src && \
    chown -R ${USER}:${USER} /home/${USER}/catkin_ws

# Set up bashrc for convenience
RUN echo "source /opt/ros/noetic/setup.bash" >> /home/${USER}/.bashrc && \
    echo "source /home/${USER}/catkin_ws/devel/setup.bash 2>/dev/null || true" >> /home/${USER}/.bashrc && \
    echo "alias cw='cd /home/${USER}/catkin_ws'" >> /home/${USER}/.bashrc && \
    echo "alias cs='cd /home/${USER}/catkin_ws/src'" >> /home/${USER}/.bashrc && \
    echo "alias cm='cd /home/${USER}/catkin_ws && catkin_make'" >> /home/${USER}/.bashrc && \
    chown ${USER}:${USER} /home/${USER}/.bashrc

# Switch to the non-root user
USER ${USER}

# Set working directory
WORKDIR /home/${USER}/catkin_ws

# Copy the script to the user's home directory
COPY create_package.sh /home/${USER}/
RUN sudo chmod +x /home/${USER}/create_package.sh

# Debugging: Print the script content and verify its location
RUN ls -l /home/${USER}/create_package.sh && \
    cat /home/${USER}/create_package.sh

# Run the script to create the dummy ROS package
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && /home/${USER}/create_package.sh"

# Set up entrypoint
COPY ./ros_entrypoint.sh /
RUN sudo chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["/bin/bash"]