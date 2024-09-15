# Creation projet rust-docker

> Ce dossier contient deux execution de docker pour deux objectif différent.  
> Ces docker sont axé pour une creation et un developpement de projet rust, mais  
> seulement pour une api web rest full

# Object 1 creer un container docker qui va creer un projet rust en local

> Ce docker va creer un container et ensuite va creer un projet rust dans le container  
> et sera donc installé également en local. Il faudra obligatoirement creer un fichier  
> `.env.dev.local` sur la copie du fichier `.env.dev.public` pour pouvoir lancer le container.

# Objectif 2 creer un container en mode developpement pour un projet rust

> Ce docker va creer un container en mode developpement avec une fonction watch  
> afin de developper le projet. Il faudra obligatoirement creer un fichier  
> `.env.dev.local` sur la copie du fichier `.env.dev.public` pour pouvoir lancer le container.

# Execution Objectif 1

- copier les dossiers et fichier suivant dans un dossier vide:

  - fichier `create-project/docker-compose.init-project.yml`
  - fichier `create-project/Dockerfile.init-project`
  - dossier `create-project/script`
  - fichier `create-project/run.sh`

- copier le fichier `.env.dev.public` et creer un fichier `.env.dev.local`
- renseigner les variables d'environnement dans le fichier `.env.dev.local`
- variable d'environment suivante sont obligatoire pour la creation du projet rust:

  - `RUST_VERSION`
  - `NAME_FILE_ENTRYPOINT`
  - `PORT_DOCKER_INIT_PROJECT`
  - `REPOSITORY_PROJECT_GITHUB`
  - `DEPENDENCIES`

- executer la commande suivante:

```bash
./run.sh
```

> Suivez les instructions dans le terminal pour terminer le processus

**ATTENTION si une erreur d'execution du fichier `run.sh` arrive
verifier les droits d'execution avec `ls -la` si les droits sont `-rw-r--r--`
alors excuter la commande `chmod +x run.sh` puis vérifier de nouveau
vous devriez avoir `-rwxr-xr-x`**

# Execution Objectif 2

- copier les dossiers et fichier suivant dans le dossier de votre projet rust:

  - fichier `container-project/docker-compose.yml`
  - fichier `container-project/Dockerfile`

- renseigner les variables d'environnement dans le fichier `.env.dev.local` (celle qui sont vide)

- lancer le container de dev:

```bash
docker compose --env-file .env.dev.local up rust-dev
```

- arreter/supprimer le container de dev:

```bash
docker compose --env-file .env.dev.local down rust-dev

# supprimer l'image en meme temps
docker compose --env-file .env.dev.local down --rmi all rust-dev
```

- lancer le container de test:

```bash
docker compose --env-file .env.dev.local up rust-test
```

- arreter/supprimer le container de test:

```bash
docker compose --env-file .env.dev.local down rust-test

# supprimer l'image en meme temps
docker compose --env-file .env.dev.local down --rmi all rust-test
```

- lancer le container de linter:

```bash
docker compose --env-file .env.dev.local up rust-test
```

- arreter/supprimer le container de linter:

```bash
docker compose --env-file .env.dev.local down rust-clippy

# supprimer l'image en meme temps
docker compose --env-file .env.dev.local down --rmi all rust-clippy
```
