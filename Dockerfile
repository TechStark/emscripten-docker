# based on Ubuntu
FROM ubuntu:latest

# environment variable
ENV EMSDK_NAME sdk-1.37.9-64bit

# update the repository sources list
RUN apt-get update

# install some packages
# curl, python, git-core
# build-essential
# openjdk-8-jdk, ant
RUN apt-get install -y curl python git-core build-essential openjdk-8-jdk ant

# download CMake
RUN cd /tmp \
    && curl -Ok https://cmake.org/files/v3.8/cmake-3.8.1-Linux-x86_64.tar.gz \
    && tar zxf cmake-3.8.1-Linux-x86_64.tar.gz \
    && rm cmake-3.8.1-Linux-x86_64.tar.gz \
    && mv cmake-3.8.1-Linux-x86_64 /opt/cmake \
    && ln -s /opt/cmake/bin/cmake /usr/bin/cmake

# download emsdk
RUN cd /tmp \
    && curl -Ok https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz \
    && tar zxf emsdk-portable.tar.gz \
    && rm emsdk-portable.tar.gz \
    && mv emsdk-portable /emsdk

# update emsdk
RUN cd /emsdk \
    && ./emsdk update \
    && ./emsdk install ${EMSDK_NAME} \
    && ./emsdk activate ${EMSDK_NAME}

# clean packages
RUN apt-get clean\
    && apt-get autoclean\
    && apt-get autoremove\
    && rm -rf /var/lib/apt/lists/*

# entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# default COMMAND
CMD ["/bin/bash"]
