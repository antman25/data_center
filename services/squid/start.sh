sudo docker pull koffin/squidward
sudo docker run --name squid -d --restart=always \
  --publish 3128:3128 \
  --volume /mnt/scratch/appdata/squid-cache-proxy:/var/cache/squid \
  koffin/squidward
