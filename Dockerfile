FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get install -y build-essential cmake ninja-build openmpi-bin libomp-dev libmetis-dev nvidia-cuda-dev nvidia-cuda-toolkit clang-tools
