#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Create shared build result folder
mkdir -p /mnt/cpack-exercise/build-result

# Create temporary build folder
mkdir /build
cd /build

# Run cmake for the project
cmake /mnt/cpack-exercise

# Cpack the project (by default the tar.gz archive and debian package, see CPackConfig.cmake)
cpack

# Copy the build result in the according folder
cp ./*.deb ./*.tar.gz /mnt/cpack-exercise/build-result