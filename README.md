# Firefox dans Docker (Windows)

Configuration pour exécuter Firefox dans Docker

## Prérequis

- Docker Desktop pour Windows
- Xming (serveur X Windows) installé

## Installation

1. Installez Xming : [Télécharger Xming](http://www.straightrunning.com/XmingNotes/)

2. Lancez Xming :
   - Utilisez les paramètres par défaut
   - Une icône Xming apparaîtra dans la barre des tâches

## Utilisation

Démarrer Firefox avec une version spécifique :
```bash
FIREFOX_VERSION=115.0 docker compose up -d
```

Ou créez un fichier `.env` avec :
```
FIREFOX_VERSION=115.0
```
Puis lancez simplement :
```bash
docker compose up -d
```

Arrêter Firefox :
```bash
docker compose down
```

## Extensions

1. Placez vos fichiers d'extensions (ou autres) dans le dossier `extensions`

## Dépannage

Si l'affichage ne fonctionne pas :
- Vérifiez que Xming est en cours d'exécution (icône dans la barre des tâches)
- Assurez-vous que le pare-feu Windows autorise Xming
