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

So you have Docker installed. Now the simple and fastest way to have an oracle up and running is to do

docker pull 83tb/zenoracles
docker 





