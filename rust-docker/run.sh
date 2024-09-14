#!/bin/bash

echo "Start process for create project rust for web api rest..."

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
    docker compose --env-file .env.dev.local -f docker-compose.init-project.yml up
    echo "Execute docker with .env.dev.local... OK"
    
    echo ""

    echo "Clean up docker container image for init project..."
    docker compose --env-file .env.dev.local -f docker-compose.init-project.yml down --rmi all
    echo "Clean up docker container image for init project... OK"

    echo ""
    
    echo "Clean up file docker init project..."
    rm -f docker-compose.init-project.yml
    rm -f Dockerfile.init-project
    echo "Clean up file docker init project... OK"

    echo ""

    if [ -z "$REPOSITORY_PROJECT_GITHUB" ]; then
        echo "REPOSITORY_PROJECT_GITHUB is not set or is empty. Skipping GitHub linking..."
        echo "Finish process for create project rust for web api rest... OK"
        echo "if project is not linked with GitHub repository, please link with GitHub repository..."
        echo "Commande -- git remote add origin <link-github-repository> --"
        echo "Please play commit and push to GitHub repository..."

        exit 0
    else
        echo "Link project with GitHub repository $REPOSITORY_PROJECT_GITHUB..."
        git remote add origin "$REPOSITORY_PROJECT_GITHUB"
        echo "Link project with GitHub repository $REPOSITORY_PROJECT_GITHUB... OK"
        echo ""
    fi

    echo "Finish process for create project rust for web api rest... OK"
    
    echo ""
    
    echo "Execute task:"
    
    echo ""
    
    echo "- delete file run.sh..."
    echo "- add content .*local in file .gitignore..."
    echo "- change branch master on main => git branch -m master main"
    echo "- add files => git add ."
    echo "- commit => git commit -m 'Initial commit'"
    echo "- push project => git push --force origin main"
    
    echo ""
    echo ""

    exit 0
fi