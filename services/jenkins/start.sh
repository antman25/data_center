docker run -d --name jenkins -p 30000:8080 -p 50000:50000 -v /mnt/scratch/volumes/jenkins:/var/jenkins_home jenkins/jenkins:lts-jdk11
