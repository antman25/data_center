TIMESTAMP=`date +%Y%m%d-%H%M%S`
REPO=nexus.antlinux.local:8443
TAG=${REPO}/custom-base/gradle
docker build --tag ${TAG}:${TIMESTAMP} --tag ${TAG}:latest . && \
docker push ${TAG}:${TIMESTAMP} && \
docker push ${TAG}:latest
