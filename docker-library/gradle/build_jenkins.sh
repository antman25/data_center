env
TIMESTAMP=`date +%Y%m%d-%H%M%S`
REPO=nexus.antlinux.local:8443
TAG=${REPO}/custom-base/hashicorp/terraform
sudo docker build --tag ${TAG}:${TIMESTAMP} --tag ${TAG}:latest -f ${WORKSPACE}/docker-library/terraform/Dockerfile ${WORKSPACE}/docker-library/terraform && \
sudo docker push ${TAG}:${TIMESTAMP} && \
sudo docker push ${TAG}:latest
