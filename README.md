# Dockerized Orisi Oracles

The easiest way to launch an Oracle, or even bunch of them for testing purposes is to use our Docker based implementation. 

#### If you're here for source code, it's not here - go to [Orisi Repo](https://github.com/orisi/orisi).


## Quick install

- If you have docker installed - running Orisi Oracle node is as easy as typing



```
docker pull orisi/oracle
```

```
docker run orisi/oracle > /dev/null &
```

ProTip: You have to do it from inside of Linux, or inside Boot2docker Virtual Machine.

That's all!


#### - If you don't have docker installed here is [super short Docker installation procedures](manual/docker_install.md), Linux, MacosX and Windows.

#### [Docker usage cheatsheet](manual/docker_basics.md)

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

