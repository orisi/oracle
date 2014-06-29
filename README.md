# ZenOracles - docker build of Orisi Oracles

This project exists because running Oracles should be easy:
* There must a simple and fast way to use it on every possible hardware or IAAS platform. 
* There must be a oneliner that runs whole Oracle
* There must be a oneliner that build whole Oracle image from sources 
* There must be a way to test new code fast in multiple scenarios and enviroments, which makes Docker more aprioprate than full VMs.


![ScreenShot](http://icons.iconarchive.com/icons/robsonbillponte/iRob/256/Drives-Server-icon.png)


## Installation process

### Linux

If you're platform is Linux that probably means you can use docker natively:

#### Ubuntu - https://docs.docker.com/installation/ubuntulinux/
#### RedHat - https://docs.docker.com/installation/rhel/


### Install Boot2Docker (for MacOSX and Windows users)

If you want to test zenoracles on a non-linux machine you're going to need to run a host for docker - a tiny smart virtual machine that can handle dockers, eats only 27mb of your RAM, and it's super fast.


Install process is very easy. It's just click and install.

#### Windows

https://github.com/boot2docker/windows-installer/releases

#### MacOSX

https://github.com/boot2docker/osx-installer/releases


After installing and running Boot2Docker:

```
boot2docker init
boot2docker start
boot2docker ssh
```

You are on a docker-host machine.

--



## Installing Orisi Docker Image


So you have Docker installed. Now the simple and fastest way to have an oracle up and running is to fetch Orisi image and run it.

```
docker pull 83tb/zenoracles
```
This command will fetch an image of the pre-build docker container for Orisi.

If you want to have everything installed from sratch you can just download the Dockerfile from the source:
```
git clone https://github.com/83tb/zenoracles.git
cd zenoracles
docker build -t zenoracle .
```
Running Orisi
```
docker run zenoracle
```











