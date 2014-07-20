## Docker Installation process

To run Oracle nodes as docker containers you're going to have to install docker package. 
There are two ways to run Docker:

- Native, using Linux

![ScreenShot](http://oracle.s3.amazonaws.com/README/native.png)

- Booting Linux VM inside Windows or Macosx.

![ScreenShot](http://oracle.s3.amazonaws.com/README/boot2docker.png)

Both ways are very easy, and will take you no more than 5 minutes.

If you have docker installed already you can go straight to [__Installing Orisi Docker Image__](https://github.com/orisi/oracle/blob/master/README.md#installing-orisi-docker-image)


### Linux


If you're platform is Linux that probably means you can use docker natively:

##### Ubuntu 
```
curl -s https://get.docker.io/ubuntu/ | sudo sh
```
https://docs.docker.com/installation/ubuntulinux/

##### RedHat 

https://docs.docker.com/installation/rhel/

#### Debian

https://docs.docker.com/installation/debian/

#### Centos

https://docs.docker.com/installation/centos/

If you installed docker package succesfully go straight to [__Installing Orisi Docker Image__](https://github.com/orisi/oracle/blob/master/README.md#installing-orisi-docker-image)


### Install Boot2Docker (for MacOSX and Windows users)

If you want to test oracle on a non-linux machine you're going to need to run a host for docker - a tiny smart virtual machine that can handle dockers, eats only 27mb of your RAM, and it's super fast.


Install process is very easy. It's just click and install.

#### Windows

https://github.com/boot2docker/windows-installer/releases

#### MacOSX

https://github.com/boot2docker/osx-installer/releases


### Bootdocker is installed. Now what?

![ScreenShot](http://oracle.s3.amazonaws.com/README/skrin0.png)

Open a console. Your system terminal.
You need to initialize and start boot2docker, and then login

```
boot2docker init
boot2docker start
boot2docker ssh
```
