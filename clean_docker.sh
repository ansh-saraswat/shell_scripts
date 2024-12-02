#!/bin/bash

# Remove dangling images (images that are not tagged and not used by any container)
echo "Removing dangling Docker images..."
docker image prune -f

# Remove stopped containers (containers that are not running)
echo "Removing stopped Docker containers..."
docker container prune -f

# Remove unused volumes (volumes not associated with any containers)
echo "Removing unused Docker volumes..."
docker volume prune -f

# Remove unused networks (networks not associated with any container)
echo "Removing unused Docker networks..."
docker network prune -f

# Summary of the space saved
echo "Summary of space usage after cleanup:"
docker system df