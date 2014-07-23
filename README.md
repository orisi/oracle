# System for launching Oracles in docker containers 

The easiest way to launch an Oracle, or even bunch of them for testing purposes is to use our Docker based implementation. You need to  have docker app installed.

- [Introduction to installation](manual/docker_install.md)
- [Docker installation for Windows](https://github.com/orisi/oracle/blob/master/manual/docker_install.md#install-boot2docker-for-macosx-and-windows-users)

- [Docker installation for MacOSX](https://github.com/orisi/oracle/blob/master/manual/docker_install.md#install-boot2docker-for-macosx-and-windows-users)

- [Docker installation for Linux](https://github.com/orisi/oracle/blob/master/manual/docker_install.md#linux)


## Quick install of Orisi node

- If you have docker installed - running Orisi Oracle node is as easy as typing



```
docker pull orisi/oracle
```

```
docker run orisi/oracle > /dev/null &
```

You have to do it from inside of Linux, or inside Boot2docker Virtual Machine. To login into your Boot2docker Virtual machine do ```bootdocker ssh``` in your local terminal.

## So I launched my node, what now?




[More information about docker commands that you mind find useful ](manual/docker_basics.md)

## Building Orisi Docker Image from source

If you want to have everything installed from scratch you can just download the Dockerfile from the source:
```
git clone https://github.com/orisi/oracle.git
cd oracle
docker build -t zenoracle .
```

>Whole process should take around 20 minutes. Your mileage may vary.

## What's running inside the container?
![ScreenShot](http://zenoracles.s3.amazonaws.com/README/content.png)

