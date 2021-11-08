folder('build-root/docker-terraform')

pipelineJob('build-root/docker-terraform/build') {

  def repo = 'http://gitlab.antlinux.local/antman/data_center.git'

  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('master')
          scriptPath('jenkins-library/docker-terraform/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

