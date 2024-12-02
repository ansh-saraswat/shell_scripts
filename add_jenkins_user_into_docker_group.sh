#!/bin/bash

# Check if the Jenkins user exists
if id "jenkins" &>/dev/null; then
    echo "Jenkins user found, adding to docker group..."

    # Check if the docker group exists
    if getent group docker &>/dev/null; then
        # Add Jenkins user to the docker group
        sudo usermod -aG docker jenkins
                
        if groups jenkins | grep -q "\bdocker\b"; then
            echo "Jenkins user has been successfully added to the docker group."
        else
            echo "Failed to add Jenkins user to the docker group."
        fi
    else
        echo "Error: Docker group does not exist. Please make sure Docker is installed."
        exit 1
    fi
else
    echo "Error: Jenkins user does not exist."
    exit 1
fi