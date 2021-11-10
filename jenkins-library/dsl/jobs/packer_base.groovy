folder('build-root/packer/base')

pipelineJob('build-root/packer/base/build') {

  def repo = 'http://gitlab.antlinux.local/antman/data_center.git'

  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('master')
          scriptPath('jenkins-library/packer/base/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

