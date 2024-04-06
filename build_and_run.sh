#!/bin/bash

# Set execute permissions for the script
chmod +x "$0"


echo "Starting build and run script..."

echo "Pulling the latest changes from the Git repository...\n"
git pull origin master

echo "Please enter the port number and service name when prompted.\n"
read -p "Enter port number: " port
read -p "Enter service name: " service_name

echo "\nStopping the existing container..."
docker stop $service_name

echo "\nRemoving the existing container..."
docker rm $service_name >/dev/null 2>&1

# Upgrade Gradle wrapper
echo "Upgrading Gradle wrapper to version 7.3...\n"
./gradlew wrapper --gradle-version 7.3

echo "\nBuilding the project with Gradle...\n"
./gradlew build

# shellcheck disable=SC2028
echo "Building Docker image...\n"
docker build -t $service_name-img .

echo "\nStarting the container with the following settings:"
echo "  Port: $port"
echo "  Service name: $service_name"
docker run -p $port:$port --name $service_name -d $service_name-img >/dev/null 2>&1

# Stream container logs
echo "Streaming logs for container $service_name. Press Ctrl+C to exit.\n"
docker logs -f $service_name
