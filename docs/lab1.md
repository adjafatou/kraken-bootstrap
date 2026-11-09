# Lab 1 — Conteneurisation d'un job de données

## 1. Objectif

Conteneuriser le job de traitement des données de stations de vélos
avec Docker afin de garantir un environnement d'exécution reproductible.

## 2. Optimisation du cache Docker

Le fichier requirements.txt est copié avant le code source.

Cette organisation permet de conserver en cache la couche
d'installation des dépendances lorsque le code de l'application change.

Le code source est ensuite copié dans l'image.

## 3. Optimisation de l'image

L'image initiale utilise python:3.12.
L'image optimisée utilise python:3.12-slim.

| Image | Taille disque |
|---|---:|
| Naïve | 2,03 Go |
| Slim | 602 Mo |

La version Slim permet une réduction d'environ 70 %.

Le fichier .dockerignore exclut les fichiers et dossiers inutiles
du contexte de construction, notamment .git, .venv, output et tests.

Le contexte de build est passé de 876,73 Ko à 687 octets.

## 4. Sécurité

Un utilisateur non privilégié nommé app est créé dans l'image.

L'instruction USER app permet d'exécuter le programme
sans utiliser l'utilisateur root.

La vérification avec docker run --entrypoint id kraken-bootstrap -u
retourne 1000.

## 5. Gestion des sorties

La variable d'environnement OUTPUT_DIR permet de définir
le répertoire de sortie du job.

Un volume Docker permet de récupérer le fichier Parquet
directement sur la machine hôte.

Fichier généré : out/stations.parquet
