env
TIMESTAMP=`date +%Y%m%d-%H%M%S`
REPO=nexus.antlinux.local:8443
TAG=${REPO}/custom-base/ansible
sudo docker build --tag ${TAG}:${TIMESTAMP} --tag ${TAG}:latest -f ${WORKSPACE}/docker-library/ansible/Dockerfile ${WORKSPACE}/docker-library/ansible && \
sudo docker push ${TAG}:${TIMESTAMP} && \
sudo docker push ${TAG}:latest
