# socat (SOcket CAT)

Socat is a command line utility that establishes two bidirectional byte streams and transfers data between them.

This repository extends the official [alpine](https://hub.docker.com/_/alpine) image by adding the socat package.

## How to use this image

`socat` can be used to provide access to a Docker daemon socket over a Docker network without configuring Docker to publish a host TCP socket. For example, run socat to listen on TCP port 2375 and connect it to `/var/run/docker.sock`.

```
$ docker run \
    --name socat \
    --network some-network \
    --detach \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    socat \
    "TCP-LISTEN:2375,reuseaddr,fork" \
    "UNIX-CLIENT:/var/run/docker.sock"
```

Then, run a [docker](https://hub.docker.com/_/docker) client and set it to connect to the socat container to access the Docker daemon.

```
$ docker run \
    --interactive \
    --tty \
    --network some-network \
    docker \
    ash
/ # docker info -f '{{ .Name }}'
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
/ # export DOCKER_HOST=tcp://socat:2375
/ # docker info -f '{{ .Name }}'
linuxkit-025000000001
```
