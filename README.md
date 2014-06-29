LINUX

If you're platform is Linux that probably means you can use docker natively:


Ubuntu
https://docs.docker.com/installation/ubuntulinux/
RedHat
https://docs.docker.com/installation/rhel/

If you want to test zenoracles on a non-linux machine you're going to need to run a host for docker - a tiny smart virtual machine that can handle dockers, eats only 27mb of your RAM, and it's super fast.

Install Boot2Docker

WINDOWS

https://github.com/boot2docker/windows-installer/releases

MACOSX

https://github.com/boot2docker/osx-installer/releases


After installing and running Boot2Docker:

boot2docker init
boot2docker start
boot2docker ssh

You are on a docker-host machine.

--

So you have Docker installed. Now the simple and fastest way to have an oracle up and running is to fetch Orisi image and run it.


Installing Orisi Docker Image

docker pull 83tb/zenoracles

This command will fetch an image of the pre-build docker container for Orisi.

If you want to have everything installed from sratch you can just download the Dockerfile from the source:

git clone https://github.com/83tb/zenoracles.git
cd zenoracles
docker build -t zenoracle .

Running Orisi

docker run zenoracle












