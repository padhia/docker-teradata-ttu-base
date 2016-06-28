# docker-teradata-ttu-base

Dockerized Teradata Tools and Utilities (TTU).

Notes:

* Before building the docker image, you should have obtained/downloaded
  Teradata TTU software. Extract `TeradataToolsAndUtilities*.tar.gz` file and
  place it in the same directory as the Dockerfile.

- All tools and utilities (including tdwallet) are installed.

- Tested with TTU 15.10.05.00

Building the docker image:

`docker build -t ttu .`

Running Teradata utilities:

`docker run -i --rm --net=host -v $HOME:$HOME -v /tmp:/tmp -e "HOME=$HOME" ttu bteq < test.bteq`
