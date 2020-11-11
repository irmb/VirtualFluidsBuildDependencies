# VirtualFluids BuildDependencies:
# Ubuntu 20.04
# general tools: wget, unzip, git
# CMake 3.16.3
# gcc 9.3 (default)
# openmpi 4.0.3
# openmp
# cuda 10.1 - Additionally download the cuda samples and add NVCUDASAMPLES_ROOT env variable
# clang 10.0 (default)
# boost serialization 1.71

FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get install -y\
    wget unzip\
    git \
    build-essential \
    cmake=3.16.3-1ubuntu1 \
    ninja-build \
    openmpi-bin=4.0.3-0ubuntu1 \
    libomp-dev \
    nvidia-cuda-dev=10.1.243-3 nvidia-cuda-toolkit=10.1.243-3 \
    clang clang-format clang-tidy clang-tools llvm-dev libclang-dev \
    libboost-serialization1.71-dev


RUN cd /tmp \
    wget https://github.com/NVIDIA/cuda-samples/archive/10.1.2.zip \
    unzip 10.1.2.zip \
    export NVCUDASAMPLES_ROOT=$(pwd)/cuda-samples-10.1.2