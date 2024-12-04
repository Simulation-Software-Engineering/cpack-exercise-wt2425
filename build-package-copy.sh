#!/bin/bash

# Build & package the project
echo "Building & packaging the project"
cd /project && \
    mkdir build && \
    cd build && \
    echo "Running cmake..." && \
    cmake .. && \
    echo "Running make install..." && \
    make -j install && \
    echo "Running cpack..." && \
    make package

# Copy the packages to the output directory
echo "Copying packages to /output"
cp /project/build/*.deb /project/build/*.tar.gz /output
echo "Done"