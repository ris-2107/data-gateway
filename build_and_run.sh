#!/bin/bash

# Set execute permissions for the script
chmod +x "$0"


echo "Starting build and run script..."

echo "Pulling the latest changes from the Git repository..."
git pull origin master

echo "Please enter the port number and service name when prompted."
read -p "Enter port number: " port
read -p "Enter service name: " service_name

echo "Stopping the existing container..."
docker stop $service_name

echo "Removing the existing container..."
docker rm $service_name >/dev/null 2>&1

# Upgrade Gradle wrapper
echo "Upgrading Gradle wrapper to version 7.3..."
./gradlew wrapper --gradle-version 7.3

echo "Building the project with Gradle..."
./gradlew build

echo "Building Docker image..."
docker build -t $service_name-img .

echo "Starting the container with the following settings:"
echo "  Port: $port"
echo "  Service name: $service_name"
docker run -p $port:$port --name $service_name -d $service_name-img >/dev/null 2>&1

# Stream container logs
echo "Streaming logs for container $service_name. Press Ctrl+C to exit."
docker logs -f $service_name
