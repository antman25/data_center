export GITLAB_HOME=/mnt/scratch/volumes/gitlab
sudo docker run --detach \
  --hostname 73.153.148.85 \
  --publish 30443:443 --publish 30080:80 --publish 30022:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest
