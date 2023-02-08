export GITLAB_HOME=/mnt/scratch/volumes/gitlab
sudo docker rm -f gitlab
sudo docker run --detach \
  --hostname gitlab.antlinux.local \
  --publish 30443:443 --publish 30080:30080 --publish 30022:22 \
  --privileged \
  --name gitlab \
  --restart always \
  -e EXTERNAL_URL="http://gitlab.antlinux.local:30080" \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  gitlab/gitlab-ce:14.9.5-ce.0
