#!/bin/bash

echo "Start process for create project React with Vite.js..."

if [ ! -f .env.dev.local ]; then
    echo "File .env.dev.local not found..."
    echo "Please create file .env.dev.local with variable environment..."
    echo "Exit process... KO"
    
    exit 1
else
    echo "set GROUP_ID and USER_ID"
    export USER_ID=$(id -u)
    export GROUP_ID=$(id -g) 
    echo "set GROUP_ID and USER_ID... OK"

    echo ""

    echo "Load variable environment..."
    source .env.dev.local
    echo "Load variable environment... OK"

    echo ""
    
    echo "Execute docker with .env.dev.local..."
    docker compose --env-file .env.dev.local up
    echo "Execute docker with .env.dev.local... OK"
    
    echo ""

    echo "Clean up docker container image for init project..."
    docker compose --env-file .env.dev.local down --rmi all
    echo "Clean up docker container image for init project... OK"

    echo ""

    echo "Finish process for create project React with Vite.js... OK"
    
    exit 0
fi