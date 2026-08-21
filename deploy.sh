#!/bin/bash

IMAGE_NAME="alpis16/second-project:v2"
CONTAINER_NAME="second-project"

echo "Step 1: Pulling the latest image ($IMAGE_NAME) from Docker Hub..."
sudo docker pull $IMAGE_NAME

echo "Step 2: Cleaning up the old container (if exists)..."
sudo docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "Step 3: Starting the new container..."
sudo docker run -d -p 8080:8080 --name $CONTAINER_NAME $IMAGE_NAME

echo "Checking container status (Waiting 3 seconds for it to start)..."
sleep 3

CONTAINER_STATE=$(sudo docker inspect -f '{{.State.Running}}' $CONTAINER_NAME 2>/dev/null)

if [ "$CONTAINER_STATE" = "true" ]; then
    echo "SUCCESS! Deployment completed. Your application is running on AWS."
else
    echo "CRITICAL ERROR! Container failed to start or crashed immediately."
    echo "Here is the reason for the crash (Logs):"
    sudo docker logs $CONTAINER_NAME
    exit 1
fi
