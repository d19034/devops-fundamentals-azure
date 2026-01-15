#!/usr/bin/env bash

echo "Building Docker image..."
docker build -t devops-demo:local ./app

echo "Stopping old container (if any)..."
docker rm -f devops-demo 2>/dev/null

echo "Starting container..."
docker run -d --name devops-demo -p 3000:3000 devops-demo:local

echo "Waiting for app to start..."
sleep 2

echo "Health check:"
curl http://localhost:3000/health
echo ""


