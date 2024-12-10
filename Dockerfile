FROM ubuntu:24.04

# Install dependencies
RUN apt-get -qq update && \
    apt-get -qq -y install \
        build-essential \
        cmake \
        git \
        libboost-all-dev \
        wget \
        libdeal.ii-dev \
        vim \
        tree \
        lintian \
        unzip \
        libyaml-cpp-dev

# Get, unpack, build, and install yaml-cpp        
RUN mkdir /software && cd /software && \
    wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip && unzip yaml-cpp-0.6.3.zip && \
    cd yaml-cpp-yaml-cpp-0.6.3 && mkdir build && cd build && \
    cmake -DYAML_BUILD_SHARED_LIBS=ON .. && make -j4 && make install    

# Set environment variables
ENV LIBRARY_PATH=/usr/local/lib/
ENV LD_LIBRARY_PATH=/usr/local/lib/
ENV PATH=/usr/local/bin/:$PATH

# Copy the project files and the build script into the container
COPY . /cpack-exercise

# Run when starting the container
CMD ["/cpack-exercise/build_package.sh"]