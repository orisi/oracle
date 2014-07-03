FROM ubuntu:12.04
MAINTAINER Kuba Kucharski <kuba@zenmakers.co>


RUN apt-get update
RUN apt-get install -y git screen python-pip
RUN echo 'root:screencast' |chpasswd
RUN chmod 777 /var/run/screen


WORKDIR /tmp

RUN git clone  https://github.com/orisi/orisi.git
RUN ./orisi/docker_install.sh


CMD ["/usr/bin/supervisord"]
#CMD    ["/usr/sbin/sshd", "-D"]

