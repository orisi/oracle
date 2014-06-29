# ZenOracles - Dockerized Orisi Oracles

This project exists because running Orisi Oracles should be easy:

* We need to be able to optimize build process
* There must a simple and fast way to use it on every possible hardware or IAAS platform. 
* There must be a oneliner that runs whole Oracle
```
docker run zenoracle
```
* There must be a oneliner that build whole Oracle image from sources 
```
docker pull 83tb/zenoracles
```
* There must be a way to test new code fast in multiple scenarios and enviroments, which makes Docker more aprioprate than full VMs.


![ScreenShot](http://pixabay.com/static/uploads/photo/2014/04/05/11/32/stone-316225_640.jpg)

## Installation process

### Linux

If you're platform is Linux that probably means you can use docker natively:

##### Ubuntu - https://docs.docker.com/installation/ubuntulinux/
##### RedHat - https://docs.docker.com/installation/rhel/

If you have docker installed alraedy you can skip to https://github.com/83tb/zenoracles/blob/master/README.md#installing-orisi-docker-image
Installing Orisi Docker Image

### Install Boot2Docker (for MacOSX and Windows users)

If you want to test zenoracles on a non-linux machine you're going to need to run a host for docker - a tiny smart virtual machine that can handle dockers, eats only 27mb of your RAM, and it's super fast.


Install process is very easy. It's just click and install.

#### Windows

https://github.com/boot2docker/windows-installer/releases

#### MacOSX

https://github.com/boot2docker/osx-installer/releases


After installing and opening Terminal window:

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
This command will fetch an image of the pre-build docker container for Orisi. Image weighs around ~47 MB. 

## Running Orisi

```
docker run zenoracle
```

## Building Orisi Docker Image from source

If you want to have everything installed from sratch you can just download the Dockerfile from the source:
```
git clone https://github.com/83tb/zenoracles.git
cd zenoracles
docker build -t zenoracle .
```

## Running Orisi Oracles on Google Compute Engine

https://developers.google.com/compute/docs/containers/container_vms

It's very easy to run multiple on Google Compute engine because it supports yaml files that allows you to create containers upon instance creation using "--metadata-from-file google-container-manifest=containers.yaml" parameter to gcloud command.



```
gcloud compute instances create orisi1 --image projects/google-containers/global/images/container-vm-v20140522 --metadata-from-file google-container-manifest=containers.yaml --zone europe-west1-b --machine-type n1-standard-1 --tags=http-server

```

## Running Orisi Oracles on AWS

https://docs.docker.com/installation/amazon/

## Updating your Orisi containers

```
docker pull 83tb/zenoracles
```

After getting the new image, restart the container. This will fetch every change in the docker container itself. But sometimes the container code will remain the same, you need "orisi code" updating mechanism.

This can be implemented easily in the Dockerfile (RUN command)
Thanks to this trick you're going to need to send "restart signal" only to your containers.















