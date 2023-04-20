#!/bin/bash
list="images-list.txt"

POSITIONAL=()
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -r|--registry)
        reg="$2"
        shift # past argument
        shift # past value
        ;;
        -l|--image-list)
        list="$2"
        shift # past argument
        shift # past value
        ;;
        -i|--images)
        images="$2"
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
    echo "USAGE: $0 [--image-list longhorn-images.txt] [--images longhorn-images.tar.gz] --registry my.registry.com:5000"
    echo "  [-l|--images-list path] text file with list of images. 1 per line."
    echo "  [-i|--images path] tar.gz generated by docker save. If empty, the script will try to find images in local docker images"
    echo "  [-r|--registry registry:port] target private registry:port. By default, registry is Docker Hub"
    echo "  [-h|--help] Usage message"
}

if [[ $help ]]; then
    usage
    exit 0
fi

if [[ -n $reg ]]; then
    reg+="/"
fi

set -e -x

if [[ $images ]]; then
    docker load --input ${images}
fi

for i in $(cat ${list}); do
    case $i in
#    */*/*)
#        docker tag ${i} ${reg}longhornio/${i#*/*/}
#        docker push ${reg}longhornio/${i#*/*/}
#        ;;
#    */*)
#        docker tag ${i} ${reg}longhornio/${i#*/}
#        docker push ${reg}longhornio/${i#*/}
#        ;;
    *)
        docker tag ${i} ${reg}${i}
        docker push ${reg}${i}
        ;;
    esac
done
