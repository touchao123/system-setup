FROM ubuntu:22.04

ARG USERNAME=ubuntu
ARG PASSWORD=ubuntu

RUN apt-get update 
RUN     \
    apt-get install -y sudo 

RUN groupadd ubuntu
RUN useradd -d /home/$USERNAME -ms /bin/bash -g ubuntu -G sudo $USERNAME

RUN echo "$USERNAME:$PASSWORD" | chpasswd

RUN mkdir -p /home/ubuntu/vubuntu-build
RUN cd /home/ubuntu/vubuntu-build && \
    git clone https://github.com/touchao123/system-setup.git && \
    cd system-setup && \
    ./ubuntu.sh
