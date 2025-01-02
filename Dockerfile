FROM ubuntu:latest

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository multiverse
RUN add-apt-repository universe
RUN apt-get update

# Installation des dépendances
RUN apt-get update && apt-get install -y \
    software-properties-common \
    x11-apps \
    xauth \
    wget \
    bzip2 \
    libgtk-3-0 \
    libdbus-glib-1-2 \
    libx11-xcb1 \
    libxt6 \
    libasound2-dev

RUN rm -rf /var/lib/apt/lists/*

# Création du répertoire pour Firefox
RUN mkdir -p /opt/firefox

RUN mkdir -p /extensions

# Script d'installation
COPY install-firefox.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/install-firefox.sh

ENV DISPLAY=host.docker.internal:0.0

# Ajout de la variable d'environnement pour la version
ENV FIREFOX_VERSION=latest

# Création utilisateur non-root
RUN useradd -m firefox-user && \
    chown -R firefox-user:firefox-user /opt/firefox
USER firefox-user

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/install-firefox.sh ${FIREFOX_VERSION}"]