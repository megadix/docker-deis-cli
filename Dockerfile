FROM debian:latest
LABEL maintainer "Dimitri De Franciscis <dimitri@megadix.it>"

RUN apt-get -y update && apt-get install -y curl bzip2 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR deis
COPY install.sh install.sh
RUN chmod u+x install.sh && ./install.sh
RUN ln -fs $PWD/deis /usr/local/bin/deis
