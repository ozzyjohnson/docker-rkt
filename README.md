docker-rkt
==========

Give [CoreOS rkt](https://coreos.com/blog/rocket/) a try inside Docker.

### Usage:

As an executable.

    sudo docker run --privileged -it --rm ozzyjohnson/rkt 

Launch an ACI.

    sudo docker run \
        --privileged -it --rm \
        docker-rkt run \
            https://github.com/coreos/etcd/releases/download/v0.5.0-alpha.4/etcd-v0.5.0-alpha.4-linux-amd64.aci
