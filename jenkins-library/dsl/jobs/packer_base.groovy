folder('build-root/packer/golden-os/centos8')
folder('build-root/packer/golden-os/centos8/CentOS-8.2.2004')
folder('build-root/packer/golden-os/centos8/CentOS-8.4.2105')

pipelineJob('build-root/packer/golden-os/centos8/CentOS-8.2.2004/build') {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")

   environmentVariables {
        env('ONE', '1')
        keepBuildVariables(true)
    }

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('master')
          scriptPath('jenkins-library/packer/baseos/centos8/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

pipelineJob('build-root/packer/golden-os/centos8/CentOS-8.4.2105/build') {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

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

