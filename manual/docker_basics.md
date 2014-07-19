### Updating your Orisi containers

```
docker pull orisi/zenoracles
```

After getting the new image, restart the container. This will fetch every change in the docker container itself. 

### Other useful commands
![ScreenShot](http://zenoracles.s3.amazonaws.com/README/commands.png)


#### Display logs for a container

```
docker logs nostalgic_elion
```

#### List running containers

```
docker ps
```

![ScreenShot](http://zenoracles.s3.amazonaws.com/README/dockerps.png)


#### See properties of certain container

```
docker inspect trusting_bardeen
```

You can use this command to check ip of the container to login via ssh or check where the persistent folder lies.


```

[{
    "Args": [],
    "Config": {
   
   ..
   
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
   
   ..
   
   
    "Volumes": {
        "/disk": "/mnt/sda1/var/lib/docker/vfs/dir/9a92e96d0a9715aa3b3927d82051de46eda88f3d1ad6337509cf84a6020f69b3"
   
```


#### Restart container
```
docker restart trusting_bardeen
```

#### Start container
```
docker start trusting_bardeen
```

#### Stop container
```
docker stop trusting_bardeen
```
#### Erase container
```
docker rm trusting_bardeen
```

#### Stop all containers
```
docker stop $(docker ps -a -q)
```
#### Erase all containers
```
docker rm $(docker ps -a -q)
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



## Security

This repo is not yet ready for production use. Take a look at issues. 
Also - you should run zenoracles with selinux enabled
```
docker --selinux-enabled=true run orisi/zenoracles > /dev/null &
```


## Errors



![ScreenShot](http://i.imgur.com/DMQZQXe.png)

If you see weird stuff like this that probably means that you're out of RAM. You can init boot2docker with -m parameter:


```
boot2docker -m 2048 init
```

This will make boot2docker use 2Gbs of RAM. It should be enough to boot ~15-20 Orisi Oracle nodes




