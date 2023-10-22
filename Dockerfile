FROM ubuntu:xenial
RUN apt-get update && \
    apt dist-upgrade -y && \
    apt-get install -y software-properties-common && \
    apt-get install -y lib32z1 && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y build-essential && \
    apt-get install -y u-boot-tools && \
    apt-get install -y imagemagick && \
    apt-get install -y libmagickcore-dev && \
    apt-get install -y doxygen;

RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

COPY CodeSourcery /home/ubuntu/CodeSourcery
ENV PATH="${PATH}:/home/ubuntu/CodeSourcery/arm-2009q1/bin"

RUN useradd -m -s /bin/bash ubuntu
WORKDIR /home/ubuntu/projects
# RUN chown -R ubuntu:ubuntu /home/ubuntu
# USER ubuntu


