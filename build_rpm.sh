#!/bin/bash

# Init paths
BASE_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BUILD_DIR="$HOME"/rpmbuild
NAME="python38-geojson"

# Create archive
echo "* Create the archive..."
rm -r "$BUILD_DIR"/SOURCES/* >/dev/null 2>&1
rm -r "$BUILD_DIR"/BUILD/* >/dev/null 2>&1
mkdir -p "$BUILD_DIR"/{SOURCES,BUILD,RPMS,SRPMS}
tar -vcz \
  --exclude='.git' \
  --exclude='.github' \
  --exclude='.gitignore' \
  --exclude='rpmbuild' \
  --exclude='build' \
  --exclude='dist' \
  --exclude='__pycache__' \
  --exclude='*.egg-info' \
  -f "$BUILD_DIR"/SOURCES/"$NAME".tar.gz "$BASE_DIR"/../"$NAME"*

# Build RPMS
echo "* Build RPM..."
rpmbuild -bb "$BASE_DIR"/rpmbuild/SPECS/"$NAME".spec
