FROM irmb/virtualfluids-deps-ubuntu20.04:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install python3-venv -y
RUN apt-get install python3-pip -y
RUN pip3 install setuptools
RUN pip3 install wheel
RUN pip3 install scikit-build
RUN pip3 install pyvista
RUN pip3 install numpy
RUN pip3 install anisble


RUN apt-get update && apt-get install -y \
    uuid-dev \
    libgpgme-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config \
    cryptsetup-bin \
    golang

RUN export VERSION=3.6.4 && \
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-${VERSION}.tar.gz && \
    tar -xzf singularity-${VERSION}.tar.gz

WORKDIR /singularity
RUN ./mconfig && \
    make -C ./builddir && \
    make -C ./builddir install

WORKDIR /