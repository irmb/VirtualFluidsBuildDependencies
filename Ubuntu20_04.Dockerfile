# VirtualFluids BuildDependencies:
# Ubuntu 20.04
# general tools: wget, unzip, git
# CMake 3.16.3
# ccache
# gcc 9.3 (default)
# openmpi 4.0.3
# openmp
# cuda 11.1.1 as a base image - Additionally download the cuda samples and add NVCUDASAMPLES_ROOT env variable
# clang 10.0 (default)
# boost serialization 1.71

FROM nvidia/cuda:11.1.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get install -y\
    wget unzip\
    git \
    build-essential \
    cmake=3.16.3-1ubuntu1 \
    ccache \
    ninja-build \
    openmpi-bin=4.0.3-0ubuntu1 \
    libomp-dev \
    clang clang-format clang-tidy clang-tools llvm-dev libclang-dev \
    libboost-serialization1.71-dev &&\
    mkdir -p /tmp &&\
    cd /tmp &&\
    wget https://github.com/NVIDIA/cuda-samples/archive/10.1.2.zip &&\
    unzip 10.1.2.zip

ENV NVCUDASAMPLES_ROOT="/tmp/cuda-samples-10.1.2"