docker pull jenkins/jenkins:lts
docker run -p 8080:8080 -p 50000:50000 -v /mnt/scratch/test:/var/jenkins_home jenkins