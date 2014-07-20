

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
Also - you should run oracle with selinux enabled
```
docker --selinux-enabled=true run orisi/oracle > /dev/null &
```


## Errors



![ScreenShot](http://i.imgur.com/DMQZQXe.png)

If you see weird stuff like this that probably means that you're out of RAM. You can init boot2docker with -m parameter:


```
boot2docker -m 2048 init
```

This will make boot2docker use 2Gbs of RAM. It should be enough to boot ~15-20 Orisi Oracle nodes




