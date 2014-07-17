# ZenOracles - Dockerized Orisi Oracles

Smart contracts allows you to transform deals, laws, business logic or any other rules into code. 
Orisi is a platform that does smart contracts.
Zenoracles project is a Docker/Container implementation of Orisi nodes.


More here -> https://github.com/orisi/wiki/wiki/Orisi-White-Paper

## Quick install

If you have docker installed - running Orisi Oracle node is as easy as typing

```
docker run orisi/zenoracles
```

That's all!

## Docker Installation process

To run Oracle nodes as docker containers you're going to have to install docker package. 
There are two ways to run Docker:

- Native, using Linux

![ScreenShot](http://zenoracles.s3.amazonaws.com/README/native.png)

- Booting Linux VM inside Windows or Macosx.

![ScreenShot](http://zenoracles.s3.amazonaws.com/README/boot2docker.png)

Both ways are very easy, and will take you no more than 5 minutes.

If you have docker installed already you can go straight to [__Installing Orisi Docker Image__](https://github.com/orisi/zenoracles/blob/master/README.md#installing-orisi-docker-image)


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

If you installed docker package succesfully go straight to [__Installing Orisi Docker Image__](https://github.com/orisi/zenoracles/blob/master/README.md#installing-orisi-docker-image)


### Install Boot2Docker (for MacOSX and Windows users)

If you want to test zenoracles on a non-linux machine you're going to need to run a host for docker - a tiny smart virtual machine that can handle dockers, eats only 27mb of your RAM, and it's super fast.


Install process is very easy. It's just click and install.

#### Windows

https://github.com/boot2docker/windows-installer/releases

#### MacOSX

https://github.com/boot2docker/osx-installer/releases


### Bootdocker is running. Now what?

![ScreenShot](http://zenoracles.s3.amazonaws.com/README/skrin0.png)

You need to initialize and start boot2docker, and then login

```
boot2docker init
boot2docker start
boot2docker ssh
```



## Running Orisi Oracle node

![ScreenShot](http://zenoracles.s3.amazonaws.com/README/skrin1.png)


So you have Docker installed. Now the simple and fastest way to have an oracle up and running is to fetch Orisi image and run it.

```
docker run orisi/zenoracles > /dev/null &
```

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

### Updating your Orisi containers

```
docker pull orisi/zenoracles
```

After getting the new image, restart the container. This will fetch every change in the docker container itself. 

### Other useful commands
![ScreenShot](http://zenoracles.s3.amazonaws.com/README/commands.png)

#### List running containers

```
docker ps
```

![ScreenShot](http://zenoracles.s3.amazonaws.com/README/dockerps.png)


#### See properties of certain container

```
docker@boot2docker:~/zenoracles$ docker inspect trusting_bardeen   
[{
    "Args": [],
    "Config": {
        "AttachStderr": true,
        "AttachStdin": false,
        "AttachStdout": true,
        "Cmd": [
            "/usr/bin/supervisord"
        ],
        "CpuShares": 0,
        "Cpuset": "",
        "Domainname": "",
        "Entrypoint": null,
        "Env": [
            "HOME=/",
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
        ],
        "ExposedPorts": {
            "22/tcp": {},
            "2523/tcp": {},
            "8333/tcp": {},
            "8444/tcp": {}
        },
        "Hostname": "49b1e9fcb605",
        "Image": "orisi/zenoracles",
        "Memory": 0,
        "MemorySwap": 0,
        "NetworkDisabled": false,
        "OnBuild": null,
        "OpenStdin": false,
        "PortSpecs": null,
        "StdinOnce": false,
        "Tty": false,
        "User": "",
        "Volumes": {
            "/disk": {}
        },
        "WorkingDir": "/disk"
    },
    "Created": "2014-07-17T15:30:37.97079109Z",
    "Driver": "aufs",
    "ExecDriver": "native-0.2",
    "HostConfig": {
        "Binds": null,
        "ContainerIDFile": "",
        "Dns": null,
        "DnsSearch": null,
        "Links": null,
        "LxcConf": [],
        "NetworkMode": "bridge",
        "PortBindings": {
            "22/tcp": null,
            "2523/tcp": null,
            "8333/tcp": null,
            "8444/tcp": null
        },
        "Privileged": false,
        "PublishAllPorts": false,
        "VolumesFrom": null
    },
    "HostnamePath": "/mnt/sda1/var/lib/docker/containers/49b1e9fcb605a05b35ae2112b040fbe95e4221d8b9960f6467d23f800d17fb13/hostname",
    "HostsPath": "/mnt/sda1/var/lib/docker/containers/49b1e9fcb605a05b35ae2112b040fbe95e4221d8b9960f6467d23f800d17fb13/hosts",
    "Id": "49b1e9fcb605a05b35ae2112b040fbe95e4221d8b9960f6467d23f800d17fb13",
    "Image": "de694088fb558d6be0c9967d120741476ced09b46bb3c1d11bfa4ec29461a187",
    "MountLabel": "",
    "Name": "/trusting_bardeen",
    "NetworkSettings": {
        "Bridge": "docker0",
        "Gateway": "172.17.42.1",
        "IPAddress": "172.17.0.32",
        "IPPrefixLen": 16,
        "PortMapping": null,
        "Ports": {
            "22/tcp": null,
            "2523/tcp": null,
            "8333/tcp": null,
            "8444/tcp": null
        }
    },
    "Path": "/usr/bin/supervisord",
    "ProcessLabel": "",
    "ResolvConfPath": "/etc/resolv.conf",
    "State": {
        "ExitCode": 0,
        "FinishedAt": "0001-01-01T00:00:00Z",
        "Paused": false,
        "Pid": 11277,
        "Running": true,
        "StartedAt": "2014-07-17T15:30:38.97525099Z"
    },
    "Volumes": {
        "/disk": "/mnt/sda1/var/lib/docker/vfs/dir/9a92e96d0a9715aa3b3927d82051de46eda88f3d1ad6337509cf84a6020f69b3"
    },
    "VolumesRW": {
        "/disk": true
    }
}

```


## Why Orisi and Docker?

* We need a way to separate __dev-ops__ code from Oracle/Client codebase
* We need to be able to __automate__ and __optimize__ build process
* There must a simple and fast way to use it on multiple __hardware__ or __IAAS__ platforms
* There must be a __oneliner__ that __runs__ whole Oracle
```
docker run orisi/zenoracles
```
* There must be an __oneliner__ to __fetch__ the newest image
```
docker pull orisi/zenoracles
```
* There must be a way to easily __update core Orisi code__ without interacting/logging into Orisi node
```
docker restart orisi/zenoracles
```

* There must be an easy way to fastly __build__ Orisi docker image __from source__
```
git clone git@github.com:orisi/zenoracles.git
cd zenoracles
docker build -t zenoracles .
```

* There must be a way to __deploy__ and test new code fast in __multiple scenarios and enviroments__


### Docker vs Full VM

So let's say you have a container image that is 1GB in size. If you wanted to use a Full VM, you would need to have 1GB times x number of VMs you want. With LXC and AuFS you can share the bulk of the 1.366 GB and if you have 1000 containers you still might only have a little over 1GB of space for the containers OS, assuming they are all running the same OS image.




## Running Orisi Oracles on Google Compute Engine

https://developers.google.com/compute/docs/containers/container_vms

It's very easy to run multiple Orisi nodes at the same time, or even a whole test set of Oracles and Clients using Google Compute engine because it supports special yaml files that allows you to create containers upon instance creation using "--metadata-from-file google-container-manifest=containers.yaml" parameter (it's a parameter to a gcloud command).



```
gcloud compute instances create orisi1 --image projects/google-containers/global/images/container-vm-v20140522 --metadata-from-file google-container-manifest=containers.yaml --zone europe-west1-b --machine-type n1-standard-1 --tags=http-server

```

## Running Orisi Oracles on AWS

Just run docker host optimized image, and from this point - the process is the same as described in this document.

https://docs.docker.com/installation/amazon/




