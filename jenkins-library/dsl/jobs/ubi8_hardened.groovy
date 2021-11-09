folder('build-root/docker/ubi8')

pipelineJob('build-root/docker/ubi8/build') {

  def repo = 'http://gitlab.antlinux.local/antman/data_center.git'

  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('master')
          scriptPath('jenkins-library/docker/ubi8/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

