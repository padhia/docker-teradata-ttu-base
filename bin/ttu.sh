#!/bin/sh

docker run -i --rm --net=host -v $HOME:$HOME -v /tmp:/tmp -e "HOME=$HOME" ttu "$(basename $0)" "$@"
