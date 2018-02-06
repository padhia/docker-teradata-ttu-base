#!/bin/sh

CMD="$(basename $0)"

# set TTUMOUNT variable to mount a host path, for example loading data. Defaults to $HOME
if [ -z "$TTUMOUNT" ]; then
    TTUMOUNT="$HOME"
fi

docker run -i \
	--rm \
	-h ttu \
	--mount type=bind,source="$TTUMOUNT",target="$TTUMOUNT" \
	--net=host \
	--security-opt seccomp:unconfined \
	--name docker-ttu \
	ttu /bin/sh -c "cd $PWD;$CMD \"\$@\"" "$CMD" "$@"
