#!/bin/bash

VERSION=${1:-"latest"}
INSTALL_DIR="/opt/firefox/firefox-${VERSION}"

# Vérification si la version de Firefox est déjà installée
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Installation de Firefox ${VERSION}..."
    
    # Définir l'URL en fonction de la version
    if [[ $VERSION == "latest" ]]; then
        URL="https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=fr"
    elif [[ $VERSION == *"esr"* ]]; then
        URL="https://download.mozilla.org/?product=firefox-esr-latest&os=linux64&lang=fr"
    else
        URL="https://download.mozilla.org/?product=firefox-${VERSION}&os=linux64&lang=fr"
    fi

    # Télécharger Firefox
    wget -O /tmp/firefox.tar.bz2 "$URL"

    # Créer le répertoire d'installation et extraire l'archive
    mkdir -p "$INSTALL_DIR"
    tar xjf /tmp/firefox.tar.bz2 -C "$INSTALL_DIR" --strip-components=1

    # Supprimer l'archive après installation
    rm /tmp/firefox.tar.bz2

    echo "Firefox ${VERSION} installé."
else
    echo "Firefox ${VERSION} est déjà installé, utilisation du cache."
fi

# Lancer Firefox
exec "$INSTALL_DIR/firefox"
