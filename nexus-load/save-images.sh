#!/bin/bash
list="images-list.txt"

POSITIONAL=()
while [[ $# -gt 0 ]]; do
	key="$1"
	case $key in
		-i|--images)
		images="$2"
		shift # past argument
		shift # past value
		;;
		-l|--image-list)
		list="$2"
		shift # past argument
		shift # past value
		;;
		-h|--help)
		help="true"
		shift
		;;
		*)
		echo "Error! invalid flag: ${key}"
		help="true"
		break
		;;
	esac
done

usage () {
	echo "USAGE: $0 [--image-list longhorn-images.txt] [--images longhorn-images.tar.gz]"
	echo "  [-l|--images-list path] text file with list of images. 1 per line."
	echo "  [-i|--images path] tar.gz generated by docker save. If this flag is empty, the script does not export images to a tar.gz file"
	echo "  [-h|--help] Usage message"
}

if [[ $help ]]; then
	usage
	exit 0
fi

set -e -x

for i in $(cat ${list}); do
	docker pull ${i}
done

if [[ $images ]]; then
	docker save $(cat ${list} | tr '\n' ' ') | gzip -c > ${images}
fi
