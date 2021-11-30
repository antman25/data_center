folder("docker/ansible")

pipelineJob("docker/ansible/build") {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${gitlabSourceBranch}")
          scriptPath('jenkins-library/docker/ansible/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

