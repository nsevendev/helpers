# Creation projet rust-docker

> Ce dossier contient deux execution de docker pour deux objectif différent.

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

  - fichier `docker-compose.init-project.yml`
  - fichier `Dockerfile.init-project`
  - dossier `script`
  - fichier `run.sh`

- copier le fichier `.env.dev.public` et creer un fichier `.env.dev.local`
- renseigner les variables d'environnement dans le fichier `.env.dev.local`
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

- en cours de construction
