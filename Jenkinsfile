node()
{
    def source_branch = env.getEnvironment().getOrDefault("SOURCE_BRANCH", "main")
    stage('ENV')
    {
        print("Params = ${params}")
        sh ('env | sort -n')
    }

    stage('Git Clone')
    {
        checkout([$class: 'GitSCM',
                branches: [[name: source_branch]],
                extensions: [],
                userRemoteConfigs:
                [[credentialsId: 'jenkins_ssh', url: 'http://gitlab.antlinux.local:30080/antman/data_center.git']]])
    }

    stage ('Run Job DSL')
    {

         jobDsl targets: ['jenkins-library/dsl/jobs/build_root.groovy',
                            'jenkins-library/dsl/jobs/packer_goldenos.groovy'].join('\n'),
         removedJobAction: 'DELETE',
         removedViewAction: 'DELETE',
         lookupStrategy: 'SEED_JOB',
         additionalParameters: params
    }
}