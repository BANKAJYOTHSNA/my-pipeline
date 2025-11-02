#!/bin/bash
APP_DIR="/home/ubuntu/jenkins-demo-app"

echo "Navigating to app directory..."
cd $APP_DIR || exit

echo "Stopping old Node.js process..."
pkill -f "node server.js" || true

echo "Pulling latest code..."
git pull origin main

echo "Installing dependencies..."
npm install

echo "Starting new server..."
nohup npm start > app.log 2>&1 &

echo "Deployment complete!"
