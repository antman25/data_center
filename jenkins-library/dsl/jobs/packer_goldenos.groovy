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
          branches("${SOURCE_BRANCH}")
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
    env('var_filepath', 'vars/stage1_iso/centos7-7.9.2009.hcl')
    env('common_triggers', "packer-library/centos/common_vm/")
    env('stage1_triggers', "packer-library/centos/ks/ks_centos8.cfg, vars/stage1_iso/centos7-7.9.2009.hcl")
    keepBuildVariables(true)
  }
  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${SOURCE_BRANCH}")
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
    env('var_filepath', 'vars/stage1_iso/centos8-8.2.2004.hcl')
    env('common_triggers', "packer-library/centos/common_vm/")
    env('stage1_triggers', "packer-library/centos/ks/ks_centos8.cfg, vars/stage1_iso/centos8-8.2.2004.hcl")
    keepBuildVariables(true)
  }

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${BUILD_BRANCH}")
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
    env('var_filepath', 'vars/stage1_iso/centos8-8.4.2105.hcl')
    env('common_triggers', "packer-library/centos/common_vm/")
    env('stage1_triggers', "packer-library/centos/ks/ks_centos8.cfg, vars/stage1_iso/centos8-8.4.2105.hcl")
    keepBuildVariables(true)
  }
  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${BUILD_BRANCH}")
          scriptPath('jenkins-library/packer/centos/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

