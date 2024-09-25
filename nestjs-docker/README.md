# Docker pour projet nestjs

- copier les dossiers et fichier suivant dans le dossier de votre projet nestjs:

    - fichier `container-project/docker-compose.yml`
    - fichier `container-project/Dockerfile`
    - dossier `container-project/scripts`

- SUR WINDOWS  

    - une fois le dossier scripts copier et coller dans votre projet  
    recreer à la main tous les fichiers du dossier scripts

- Plus de flexibilité:

    - changer le nom du network avec votre nom de votre projet par defaut (nest-network)

- Suivre les procedures suivantes:  

-   Lancement des containers

```bash
# lancement de tout les containers api + bdd
docker compose --env-file .env.dev.local up

# lancement du container api
# attention le container de la bdd doit être lancé
docker compose --env-file .env.dev.local up api

# lancement du container bdd
docker compose --env-file .env.dev.local up db
```

-   Arret des containers

```bash
# arret de tout les containers
docker compose --env-file .env.dev.local down

# arret du container api
docker compose --env-file .env.dev.local down api

# arret du container bdd
docker compose --env-file .env.dev.local down db
```
