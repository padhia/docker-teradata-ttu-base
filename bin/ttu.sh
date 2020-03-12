#!/bin/sh

# mount all paths from TTUMOUNTS variable (paths must be separated by : -- like in PATH variable). Defaults to $HOME
mount_opts() {
	if [ -z "$TTUMOUNTS" ]; then
		TTUMOUNTS="$HOME"
	fi

	OLD_IFS="$IFS"
	IFS=":"
	for M in $TTUMOUNTS; do
		echo --mount type=bind,source="$M",target="$M"
	done
	IFS="$OLD_IFS"
}

CMD="$(basename $0)"

docker run -i \
	--rm \
	-h "$CMD" \
	$(mount_opts) \
	--net=host \
	--security-opt seccomp:unconfined \
	--name docker-ttu \
	--workdir "$PWD" \
	--user "$(id -u):$(id -g)" \
	ttu "$CMD" "$@"
