#!/bin/sh

# Vérifier si le projet existe déjà
if [ ! -f "package.json" ]; then
  echo "Aucun projet trouvé, création d'un projet React avec Vite.js..."
  npm init vite@latest . -- --template react-ts
  npm install
  exit 0
else
  echo "Projet déjà existant, démarrage du projet..."
  exit 0
fi