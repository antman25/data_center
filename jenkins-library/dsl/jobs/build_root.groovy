folder('build-root')

folder('build-root/docker')
folder('build-root/packer')

pipelineJob('build-root/build-master') {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")
  parameters {
    stringParam('BUILD_BRANCH', 'main', 'build this branch')
  }
  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('main')
          scriptPath('jenkins-library/build-master/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}
