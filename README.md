# Kubectl image for Docker

[![Travis CI](https://img.shields.io/travis/bug-c/kubectl-docker/master.svg)](https://travis-ci.org/bug-c/kubectl-docker/branches) 
[![Docker Pulls](https://img.shields.io/docker/pulls/ctdc/kubectl.svg)](https://hub.docker.com/r/ctdc/kubectl/) 
[![Docker Stars](https://img.shields.io/docker/stars/ctdc/kubectl.svg)](https://hub.docker.com/r/ctdc/kubectl/) 
[![](https://images.microbadger.com/badges/image/ctdc/kubectl.svg)](https://microbadger.com/images/ctdc/kubectl "Get your own image badge on microbadger.com")
[![Docker Build](https://img.shields.io/docker/automated/ctdc/kubectl.svg)](https://cloud.docker.com/swarm/ctdc/repository/docker/ctdc/kubectl/builds)

## What is `kubectl`

`kubectl` is a CLI tool to control a cluster [Kubernetes](http://kubernetes.io/).

## Usage

    $ docker run --rm ctdc/kubectl:latest

# Get this image

The recommended way to get this Kubectl Docker Image is to pull the prebuilt image from the [Docker Hub Registry](https://hub.docker.com/r/ctdc/kubectl).

```console
$ docker pull ctdc/kubectl:latest
```

To use a specific version, you can pull a versioned tag. You can view the [list of available versions](https://hub.docker.com/r/ctdc/kubectl/tags/) in the Docker Hub Registry.

```console
$ docker pull ctdc/kubectl:[TAG]
```

If you wish, you can also build the image yourself.

```console
$ docker build -t ctdc/kubectl:latest 'https://github.com/bug-c/kubectl-docker.git#master'
```

# Configuration

## Running commands

To run commands inside this container you can use `docker run`, for example to execute `kubectl --version` you can follow the example below:

```console
$ docker run --rm --name kubectl ctdc/kubectl:latest -- --version
```

Consult the [Kubectl Reference Documentation](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands) to find the completed list of commands available.

## Loading your own configuration

It's possible to load your own configuration, which is useful if you want to connect to a remote cluster:

```console
$ docker run --rm --name kubectl -v /path/to/your/kube/config:/.kube/config -e="KUBECONFIG=/.kube/config" ctdc/kubectl:latest
```

If you need to change kube config but you don't want the changes to persist:

```console
$ docker run --rm --name kubectl --mount type=tmpfs,destination=/.kube -v /path/to/your/kube/config:/.kube/config -e="KUBECONFIG=/.kube/config" ctdc/kubectl:latest
```

Example of running a custom script:

```console
$ docker run --rm --name kubectl -v /path/to/your/kube/config:/.kube/config -v /path/to/your/script:/src -w="/src" -e="KUBECONFIG=/.kube/config" --entrypoint="/src/deploy.sh" ctdc/kubectl $SCRIPT_ARGS
```



# Contributing

You can request new features by creating an [issue](https://github.com/bug-c/kubectl-docker/issues), or submit a [pull request](https://github.com/bug-c/kubectl-docker/pulls) with your contribution.


# Issues

If you encountered a problem running this container, you can file an [issue](https://github.com/bug-c/kubectl-docker/issues/new). To provide better support, be sure to include the following information in your issue:

- Host OS and version
- Docker version (`docker version`)
- Output of `docker info`
- Version of this container
- The command you used to run the container, and any relevant output you saw (masking any sensitive information)

# Thanks

Thanks to https://github.com/BuoyantIO/kubectl

Thanks to https://github.com/roffe/docker-kubectl

Thanks to https://github.com/bitnami/bitnami-docker-kubectl