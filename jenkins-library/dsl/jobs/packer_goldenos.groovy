folder("packer/golden-baseos")
folder("packer/golden-baseos/winsvr2019")
folder("packer/golden-baseos/winsvr2019/winsvr2019-JAN2021")

pipelineJob("packer/golden-baseos/winsvr2019/winsvr2019-JAN2021/build") {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${gitlabSourceBranch}")
          scriptPath('jenkins-library/packer/winsvr/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}


folder("packer/golden-baseos/centos7")
folder("packer/golden-baseos/centos7/CentOS-7.9.2009")

pipelineJob("packer/golden-baseos/centos7/CentOS-7.9.2009/build") {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")

  environmentVariables {
    env('var_filepath', 'vars/centos7-7.9.2009.hcl')
    env('triggers', "packer-library/centos/common/; packer-library/centos/golden/scripts/; packer-library/centos/golden/; ")
    keepBuildVariables(true)
  }
  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${gitlabSourceBranch}")
          scriptPath('jenkins-library/packer/centos/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

folder("packer/golden-baseos/centos8")
folder("packer/golden-baseos/centos8/CentOS-8.2.2004")

pipelineJob("packer/golden-baseos/centos8/CentOS-8.2.2004/build") {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")
  /*parameters {
    stringParam('SOURCE_BRANCH', 'main', 'build this branch')
  }*/
  environmentVariables {
    env('var_filepath', 'vars/centos8-8.2.2004.hcl')
    env('triggers', "packer-library/centos/common/; packer-library/centos/golden/scripts/; packer-library/centos/golden/; ")
    keepBuildVariables(true)
  }

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${gitlabSourceBranch}")
          scriptPath('jenkins-library/packer/centos/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

folder("packer/golden-baseos/centos8/CentOS-8.4.2105")

pipelineJob("packer/golden-baseos/centos8/CentOS-8.4.2105/build") {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'


  description("Pipeline for $repo")
  /*parameters {
    stringParam('BUILD_BRANCH', '', 'build this branch')
  }*/
  environmentVariables {
    env('var_filepath', 'vars/centos8-8.4.2105.hcl')
    env('triggers', "packer-library/centos/common/; packer-library/centos/golden/scripts/; packer-library/centos/golden/; ")
    keepBuildVariables(true)
  }
  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${gitlabSourceBranch}")
          scriptPath('jenkins-library/packer/centos/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

