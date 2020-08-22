#!/bin/sh

CMD="$(basename $0)"

docker run -i \
    --rm \
    -h "$CMD" \
    --user $(id -u):$(id -g) \
    --mount type=bind,source=$HOME,target=$HOME \
    --mount type=bind,source=/tmp,target=/tmp \
    --mount type=bind,source=/data,target=/data \
    --mount type=bind,source=/etc/passwd,target=/etc/passwd,ro \
    --mount type=bind,source=/etc/shadow,target=/etc/shadow,ro \
    --mount type=bind,source=/etc/group,target=/etc/group,ro \
    --mount type=volume,src=wallets,dst=/opt/teradata/client/tdwallet/wallets \
    --net=host \
    --security-opt seccomp:unconfined \
    --name docker-ttu \
    --workdir "$PWD" \
    ttu "$CMD" "$@"
