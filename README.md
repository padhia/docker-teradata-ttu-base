# docker-teradata-ttu-base

Dockerized Teradata Tools and Utilities (TTU).

Notes:

* Before building the docker image, you should have obtained/downloaded
  Teradata TTU software.
* Extract `TeradataToolsAndUtilities*.tar.gz` file and place it in the same
  directory as the Dockerfile.
* Make sure the directory has only one version of TTU software.
* All tools and utilities (including tdwallet) are installed.
* Tested with TTU 15.10.08.00 and 16.00.01.00

Building the docker image:<br/>
`docker build -t ttu .`

Running Teradata utilities:<br/>
`docker run -i --rm --net=host -v $HOME:$HOME -v /tmp:/tmp -e "HOME=$HOME" ttu bteq < test.bteq`

Include `bin` folder in your host's `PATH` to provide seamless access to
dockerized TTU commands
