folder("docker/ubi8")

pipelineJob("docker/ubi8/build") {

  def repo = 'http://gitlab.antlinux.local:30080/antman/data_center.git'

  description("Pipeline for $repo")

  definition {
    cpsScm {
      scm {
        git {
          remote { url(repo) }
          branches("${gitlabSourceBranch}")
          scriptPath('jenkins-library/docker/ubi8/Jenkinsfile')
          extensions { }  // required as otherwise it may try to tag the repo, which you may not want
        }

      }
    }
  }
}

