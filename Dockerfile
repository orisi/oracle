

FROM ubuntu:12.04
MAINTAINER Kuba Kucharski <kuba@zenmakers.co>

RUN apt-get update
RUN apt-get install --yes build-essential libssl-dev libboost-all-dev

RUN apt-get install --yes python-software-properties
RUN add-apt-repository --yes ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install --yes db4.8

RUN apt-get install --yes git

RUN adduser --disabled-login --gecos "" orisi




WORKDIR /home/orisi

RUN git clone https://github.com/bitcoin/bitcoin.git

WORKDIR /home/orisi/bitcoin/src

RUN ./autogen.sh && ./configure && make
 
RUN cp bitcoin/src/bitcoind /usr/local/bin/bitcoind

ADD . /home/orisi/testoracle

RUN chown -R orisi:orisi /home/orisi/testoracle

USER orisi

WORKDIR /home/orisi/testoracle

EXPOSE 19001 19011
CMD ["/bin/bash"]


