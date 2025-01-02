#!/bin/bash
VERSION=${1:-"latest"}

if [[ $VERSION =~ ^[0-9] ]]; then
    # Version numérique (ex: 115.0)
    snap install firefox --channel="$VERSION/stable"
elif [ "$VERSION" != "latest" ]; then
    # Canaux snap (beta, candidate, edge)
    snap install firefox --channel="$VERSION"
fi

exec /snap/bin/firefox