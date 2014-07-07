FROM ubuntu:12.04
MAINTAINER Kuba Kucharski <kuba@zenmakers.co>




RUN apt-get update
RUN apt-get install -y git screen sudo python-pip joe openssh-server supervisor 
RUN apt-get install -y build-essential make g++ libtool autotools-dev autoconf python-dev
RUN echo 'root:screencast' |chpasswd
RUN chmod 777 /var/run/screen
RUN mkdir /var/run/sshd

WORKDIR /root

RUN git clone  https://github.com/orisi/orisi.git
RUN git clone  https://github.com/orisi/zenoracles.git
RUN chmod +x ./zenoracles/install.sh

RUN ./zenoracles/install.sh


ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8333 8444 2523
#RUN cp -R .config ./

#
RUN chmod +x ./zenoracles/initial_bitmesg_run.sh
RUN chmod +x ./zenoracles/initial_oracle_run.sh
RUN chmod +x ./zenoracles/initial_bitcoind_run.sh
RUN chmod +x ./zenoracles/docker_runoracle.sh

RUN cp ./zenoracles/initial* /usr/bin/

#RUN echo "ORACLE_ADDRESS=\"18674hp8BBARJfmvqBwBvLs1EWByaerk7J\"" >> ./orisi/src/settings_local.py
#CMD    ["./zenoracles/docker_runoracle.sh"]

CMD ["/usr/bin/supervisord"]
