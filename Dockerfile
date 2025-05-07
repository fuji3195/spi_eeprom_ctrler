# syntax=docker/dockerfile:1
FROM ubuntu:24.04

# Package update / install necessary tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y -no-install-recommends make gcc g++ python3 python3-pip python3-venv python3-dev \
    build-essential verilator gtkwave

# Create venv
RUN python3 -m venv /opt/venv

# set PATH for using venv pip
ENV PATH="/opt/venv/bin:$PATH"

# install coctb to virtual env
RUN pip install --upgrade pip && pip install cocotb=1.9.2 pytest cocotb-test

WORKDIR /project
CMD ["/bin/bash"]