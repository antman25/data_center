folder("docker/packer")

pipelineJob("docker/packer/build") {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${SOURCE_BRANCH}")
          scriptPath('jenkins-library/docker/packer/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

