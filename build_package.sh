#!/bin/sh
chmod 0644 /cpack-exercise/cmake/debian/triggers # Fix permissions for lintian

mkdir -p /cpack-exercise/build && cd /cpack-exercise/build  && \
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release ..  && \
make -j  && \
make package  && \

# Create the output directory if it doesn't exist
mkdir -p ../output

# Move the packages to the output directory
cp *.tar.gz *.deb ../output