FROM ubuntu:12.04
MAINTAINER Kuba Kucharski <kuba@zenmakers.co>

RUN mkdir /disk

RUN useradd docker
RUN echo "docker:docker" | chpasswd
RUN echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN sudo apt-get update
RUN sudo apt-get install -y git screen sudo python-pip joe openssh-server supervisor 

USER docker



RUN sudo apt-get install -y build-essential make g++ libtool autotools-dev autoconf python-dev
RUN echo 'root:password' |chpasswd
RUN sudo chmod 777 /var/run/screen
RUN sudo mkdir /var/run/sshd


WORKDIR /disk



RUN sudo git clone  https://github.com/orisi/orisi.git /disk/orisi
RUN sudo git clone  https://github.com/orisi/zenoracles.git /disk/zenoracles

RUN sudo chmod +x /disk/orisi/docker_install.sh



RUN sudo /disk/orisi/docker_install.sh


ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8333 8444 2523
#RUN cp -R .config ./

#

RUN chmod +x /disk/zenoracles/initial_oracle_run.sh
RUN chmod +x /disk/zenoracles/initial_bitcoind_run.sh




RUN cp /disk/zenoracles/initial* /usr/bin/
#RUN echo "ORACLE_ADDRESS=\"18674hp8BBARJfmvqBwBvLs1EWByaerk7J\"" >> ./orisi/src/settings_local.py
#CMD    ["./zenoracles/docker_runoracle.sh"]

VOLUME /disk

CMD ["/usr/bin/supervisord"]
