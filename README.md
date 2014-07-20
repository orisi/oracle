# ZenOracles - Dockerized Orisi Oracles

Smart contracts allows you to transform deals, laws, business logic or any other rules into code. 
Orisi is a platform that does smart contracts.
Zenoracles project is a Docker/Container implementation of Orisi nodes.


More here -> https://github.com/orisi/wiki/wiki/Orisi-White-Paper

## Quick install

If you have docker installed - running Orisi Oracle node is as easy as typing

[Super short Docker installation procedures](manual/docker_install.md)

```
docker pull orisi/zenoracles
```

```
docker run orisi/zenoracles > /dev/null &
```

That's all!


## Building Orisi Docker Image from source

If you want to have everything installed from scratch you can just download the Dockerfile from the source:
```
git clone https://github.com/orisi/zenoracles.git
cd zenoracles
docker build -t zenoracle .
```

>Whole process should take around 20 minutes. Your mileage may vary.

## What's running inside the container?
![ScreenShot](http://zenoracles.s3.amazonaws.com/README/content.png)

