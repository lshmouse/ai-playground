#!/bin/bash
set -u

TOP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
source $TOP_DIR/scripts/playground.bashrc

function _usage() {
	echo -e "\n${RED}Usage${NO_COLOR}:
    .${BOLD}/playground.sh${NO_COLOR} [OPTION]"
	echo -e "\n${RED}Options${NO_COLOR}:
    ${BLUE}start_dev_docker [options]${NO_COLOR}: start a development docker container.
    ${BLUE}stop_dev_docker [options]${NO_COLOR}: stop the development docker container.
    ${BLUE}usage${NO_COLOR}: show this message and exit
    "
}

function start_dev_docker() {
	local image_name="ai-playground-dev:latest"
	local container_name="ai-playground-dev"
	local mount_dir="${TOP_DIR}"
	local mount_point="/ai-playground"

	if [ -z "$(docker ps -q -f name=$container_name)" ]; then
		echo "Starting dev docker container..."
		docker run -it --rm \
			-v $mount_dir:$mount_point \
			-w $mount_point \
			--name $container_name \
			$image_name \
			/bin/bash
	else
		echo "Dev docker container is already running. Just attaching to it..."
		docker exec -it $container_name /bin/bash
	fi
}

function stop_dev_docker() {
	local container_name="ai-playground-dev"

	if [ -z "$(docker ps -q -f name=$container_name)" ]; then
		echo "Dev docker container is not running. Exiting..."
		exit 1
	else
		echo "Stopping dev docker container..."
		docker stop $container_name
	fi
}

function main() {
	if [ "$#" -eq 0 ]; then
		_usage
		exit 0
	fi

	local cmd="$1"
	shift

	case "$cmd" in
	start_dev_docker)
		start_dev_docker "$@"
		;;
	stop_dev_docker)
		stop_dev_docker "$@"
		;;
	usage)
		_usage
		;;
	-h | --help)
		_usage
		;;
	esac
}

main "$@"
