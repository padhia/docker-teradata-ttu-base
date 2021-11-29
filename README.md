# docker-teradata-ttu-base

Dockerized Teradata Tools and Utilities (TTU).

Steps to build a TTU Docker image:

1. Make sure `docker` is installed
1. Download the latest Teradata TTU software package (17.10 or later) for **Ubuntu** from [here](https://downloads.teradata.com/download/tools/teradata-tools-and-utilities-linux-installation-package-0) and place in the same directory as the `Dockerfile` file
1. To build the default TTU docker image containing all tools and utilities:
```sh
docker build -t ttu .
```

You can create custom docker images to include only selected tools. For example, following commands will build images containing `bteq` and `tdwallet`, and `TPT` and `tdwallet` respectively.
```sh
docker build --build-arg cmd=bteq --build-arg tools="bteq tdwallet" -t bteq .
docker build --build-arg cmd=tbuild --build-arg tools="tptbase tptstream tdwallet" -t tpt .
```

How to run docker images:
```sh
docker run -i --rm --net=host -v $HOME:$HOME -v /tmp:/tmp -e "HOME=$HOME" ttu bteq < test.bteq
```

For a more seamless access, customize the scripts in the `bin` folder and include in your host's `PATH`. Assuming the `bin` folder is in path, you can then run:
```sh
bteq < test.bteq
```
