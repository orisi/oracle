# System for launching Oracles in docker containers 

The easiest way to launch an Oracle, or even bunch of them for testing purposes is to use our Docker based implementation. You need to  have docker app installed.

- [Introduction to installation](manual/docker_install.md)
- [Docker installation for Windows](https://github.com/orisi/oracle/blob/master/manual/docker_install.md#install-boot2docker-for-macosx-and-windows-users)

- [Docker installation for MacOSX](https://github.com/orisi/oracle/blob/master/manual/docker_install.md#install-boot2docker-for-macosx-and-windows-users)

- [Docker installation for Linux](https://github.com/orisi/oracle/blob/master/manual/docker_install.md#linux)


# Quick install of Orisi node


If you have docker installed - running Orisi Oracle node is as easy as typing 2 docker commands.

Important: you have to do it from inside of Linux, or inside Boot2docker Virtual Machine. To login into your Boot2docker Virtual machine do ```bootdocker ssh``` in your local terminal.

```
docker pull orisi/oracle
```

```
docker run -name oracle_node orisi/oracle > /dev/null &
```



## So I launched my node, what now?

Upon first creation of the node's docker container we generated keys for you. You will need to share with us some things to get into the smart contract charter:

- BitMessage address of your Oracle
- Public address of your Oracle
- Multi-sig address of your Oracle

### You can do it using commands below
```
docker logs oracle_node | grep "BM address"
docker logs oracle_node | grep "my pubkey"
docker logs oracle_node | grep "my multisig address"
```
## How to login into my oracle using ssh?

First you need to get to know ip address of your container.
```
docker inspect oracle_node | grep IPAddress
```

And then ssh into your machine:

```
ssh root@ip
```

Ssh running on the container is just a temporary measure, default password for root is .. password. Container is not exposed on public ip so it's not a big deal yet, but change it as soon as you can.

Now you can list the processes running on your container using standard linux commands

```
ps xa
```

## Where are the logs?

The easiest way to see logs is not to login usings ssh, but use docker logs command
```
docker logs oracle_node
```

In the container itself logs are in /var/log/supervisord/

orisi.log - logs only for oracle.py

supervisord.log - logs you see when you does docker logs oracle_node on a host machine, they contain everything

## Where is the code?

All the code lies in a /disk folder of the container. You can access this folder from the boot2docker VM. To see where it is, do:

```docker inspect oracle_node | grep /disk```

The path will be something like this:

```/var/lib/docker/vfs/dir/e5dd1b11d699441fa33b1ab97293f7ca6aa502b345e4b577173d0527f63b79ee```
```

To update Orisi code do: 

cd /var/lib/docker/vfs/dir/e5dd1b11d699441fa33b1ab97293f7ca6aa502b345e4b577173d0527f63b79ee/orisi
git pull
```
And then to restart oracle node:

```
docker restart oracle_node
```

You can of course change the repo from the official one to your own, or some different branch, just go into the persistent folder for your container and do your thing.

## How do I start/stop running a node?

* Restart container
```
docker restart oracle_node
```

* Start container
```
docker start oracle_node
```

* Stop container
```
docker stop oracle_node
```



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

