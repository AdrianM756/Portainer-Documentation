#!/bin/bash

## NOTE: Make sure to change this in to an executable file after downloaded. For example: "chmod +x install_portainer.sh"

# Create Docker volume for Portainer data
echo "Creating Docker volume 'portainer_data'..."
docker volume create portainer_data

# Run Portainer Server container
echo "Deploying Portainer Server container..."
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:lts

# Optional: Uncomment the following line to expose legacy HTTP port 9000.
#docker run -d -p 8000:8000 -p 9443:9443 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts

# Display running containers
echo "Checking if Portainer Server is running..."
docker ps

# Show IP addresses
LOCAL_IP=$(hostname -I | awk '{print $1}')
PUBLIC_IP=$(curl -s ifconfig.me)

echo "Network Info:"
echo "Local IP Address: $LOCAL_IP"
echo "Public IP Address: $PUBLIC_IP"

echo "Installation complete."
echo "Access Portainer at: https://$LOCAL_IP:9443 or https://localhost:9443"

