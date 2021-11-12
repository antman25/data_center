folder('build-root/packer/golden-baseos')
folder('build-root/packer/golden-baseos/winsvr2019')
folder('build-root/packer/golden-baseos/winsvr2019/winsvr2019-JAN2021')

pipelineJob('build-root/packer/golden-baseos/winsvr2019/winsvr2019-JAN2021/build') {

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
          scriptPath('jenkins-library/packer/winsvr/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}


folder('build-root/packer/golden-baseos/centos7')
folder('build-root/packer/golden-baseos/centos7/CentOS-7.9.2009')

pipelineJob('build-root/packer/golden-baseos/centos7/CentOS-7.9.2009/build') {

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
          scriptPath('jenkins-library/packer/centos/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

folder('build-root/packer/golden-baseos/centos8')
folder('build-root/packer/golden-baseos/centos8/CentOS-8.2.2004')

pipelineJob('build-root/packer/golden-baseos/centos8/CentOS-8.2.2004/build') {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")
  parameters {
    stringParam('BUILD_BRANCH', 'main', 'build this branch')
  }
  environmentVariables {
    env('ONE', '1')
    keepBuildVariables(true)
  }

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches('main')
          scriptPath('jenkins-library/packer/centos/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

folder('build-root/packer/golden-baseos/centos8/CentOS-8.4.2105')

pipelineJob('build-root/packer/golden-baseos/centos8/CentOS-8.4.2105/build') {

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
          scriptPath('jenkins-library/packer/centos/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

