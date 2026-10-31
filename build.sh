#!/bin/sh
# Builds dist/service.refract-<version>.zip, installable in Kodi with "Install from zip file".
set -e
cd "$(dirname "$0")"
version=$(sed -n 's/.*<addon id="service.refract"[^>]*version="\([^"]*\)".*/\1/p' service.refract/addon.xml)
mkdir -p dist
rm -f "dist/service.refract-$version.zip"
zip -qr "dist/service.refract-$version.zip" service.refract -x '*/__pycache__/*' '*.pyc' '*/.DS_Store'
echo "dist/service.refract-$version.zip"
