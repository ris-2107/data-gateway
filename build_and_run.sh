#!/bin/bash

# Pull the latest changes from the Git repository
git pull origin master

# Prompt user for port and service name
read -p "Enter port number: " port
read -p "Enter service name: " service_name

# Stop and remove the existing container
docker stop $service_name
docker rm $service_name

# Upgrade Gradle wrapper
./gradlew wrapper --gradle-version 7.3

# Build the project
./gradlew build

# Build Docker image
docker build -t $service_name-img .

# Run the container
docker run -p $port:$port --name $service_name -d $service_name-img
