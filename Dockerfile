

FROM ubuntu:12.04
MAINTAINER Kuba Kucharski <kuba@zenmakers.co>


ENV BITCOIN_DOWNLOAD_VERSION 0.9.1
ENV BITCOIN_DOWNLOAD_MD5_CHECKSUM 7a9c14c09b04e3e37d703fbfe5c3b1e2

RUN apt-get update
RUN apt-get install -y git wget build-essential make g++  python-pip libboost-all-dev libssl-dev libdb++-dev libtool autotools-dev autoconf libboost-all-dev bsdmainutils pkg-config

RUN apt-get install -y openssh-server


WORKDIR /tmp
RUN wget --no-check-certificate https://github.com/bitcoin/bitcoin/archive/v$BITCOIN_DOWNLOAD_VERSION.tar.gz

RUN echo "$BITCOIN_DOWNLOAD_MD5_CHECKSUM  v$BITCOIN_DOWNLOAD_VERSION.tar.gz" | md5sum -c -
RUN tar xfz v$BITCOIN_DOWNLOAD_VERSION.tar.gz && mv bitcoin-$BITCOIN_DOWNLOAD_VERSION bitcoin

WORKDIR /tmp/bitcoin
RUN ./autogen.sh
RUN ./configure --disable-wallet
RUN make
RUN make install

RUN whereis git

RUN git clone  https://github.com/orisi/orisi.git
RUN pip install -r orisi/requirements.txt
RUN git clone git://github.com/Bitmessage/PyBitmessage.git
RUN cp orisi/src/settings_local.py.example orisi/src/settings_local.py
RUN mkdir .bitcoin
RUN touch .bitcoin/bitcoin.conf

ENV BTCRPC "openssl rand -hex 32"
RUN echo rpcuser=bitrpc >> .bitcoin/bitcoin.conf
RUN echo rpcpassword=$BTCRPC >> .bitcoin/bitcoin.conf
RUN echo BITCOIND_RPC_PASSWORD = \"$BTCRPC\" >> src/settings_local.py

EXPOSE     8333
EXPOSE     8444


#RUN python PyBitmessage/src/bitmessagemain.py > /dev/null 

RUN mkdir .config
RUN mkdir .config/PyBitmessage


RUN echo daemon = true >> .config/PyBitmessage/keys.dat
RUN echo apienabled = true >> .config/PyBitmessage/keys.dat
RUN echo apiport = 8442 >> .config/PyBitmessage/keys.dat
RUN echo apiinterface = 127.0.0.1 >> .config/PyBitmessage/keys.dat
RUN echo apiusername = bitrpc >> .config/PyBitmessage/keys.dat
ENV BMPW "openssl rand -hex 32"
RUN echo "apipassword = $BMPW" >> .config/PyBitmessage/keys.dat
RUN echo BITMESSAGE_PASSWORD = \"$BMPW\" >> src/settings_local.py


RUN mkdir /var/run/sshd
RUN echo 'root:screencast' |chpasswd

EXPOSE 22

CMD python PyBitmessage/src/bitmessagemain.py > /dev/null &
CMD bitcoin/bin/$(getconf LONG_BIT)/bitcoind -connect=127.0.0.1 &

CMD python orisi/src/run_oracle.py


CMD    ["/usr/sbin/sshd", "-D"]
