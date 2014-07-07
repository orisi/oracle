FROM ubuntu:12.04
MAINTAINER Kuba Kucharski <kuba@zenmakers.co>




RUN apt-get update
RUN apt-get install -y git screen python-pip joe openssh-server supervisor 
RUN apt-get install -y build-essential make g++ libtool autotools-dev autoconf python-dev
RUN echo 'root:screencast' |chpasswd
RUN chmod 777 /var/run/screen
RUN mkdir /var/run/sshd

WORKDIR /root

RUN git clone  https://github.com/orisi/orisi.git
RUN git clone  https://github.com/orisi/zenoracles.git
RUN chmod +x ./orisi/docker_install.sh

RUN ./orisi/docker_install.sh


ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 8333 8444 2523
#RUN cp -R .config /root/

#
RUN chmod +x /root/zenoracles/initial_bitmesg_run.sh
RUN chmod +x /root/zenoracles/initial_oracle_run.sh
RUN chmod +x /root/zenoracles/initial_bitcoind_run.sh
RUN chmod +x /root/zenoracles/docker_runoracle.sh

RUN echo "ORACLE_ADDRESS=BM-2cUQCkgULn6CyQxuCkn57LvAsXw3xiBZBY" >> /root/orisi/src/settings_local.py
#CMD    ["/root/zenoracles/docker_runoracle.sh"]

CMD ["/usr/bin/supervisord"]
