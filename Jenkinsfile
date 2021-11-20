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

    all_stages = [:]

    stage('Build packer-CentOS-7.9.2009')
    {
        build job: "packer/golden-baseos/centos7/CentOS-7.9.2009/build", parameters: [[$class: 'StringParameterValue', name: 'BUILD_BRANCH', value: source_branch]]
    }

    stage('Build packer-CentOS-8.2.2004')
    {
        build job: "packer/golden-baseos/centos8/CentOS-8.2.2004/build", parameters: [[$class: 'StringParameterValue', name: 'BUILD_BRANCH', value: source_branch]]
    }

    stage('Build packer-CentOS-8.4.2105')
    {
        build job: "packer/golden-baseos/centos8/CentOS-8.4.2105/build", parameters: [[$class: 'StringParameterValue', name: 'BUILD_BRANCH', value: source_branch]]
    }



            /*all_stages['packer_CentOS-7.9.2009'] = {
                                                        stage('Build packer-CentOS-7.9.2009')
                                                        {
                                                                build job: "packer/golden-baseos/centos7/CentOS-7.9.2009/build", parameters: [[$class: 'StringParameterValue', name: 'BUILD_BRANCH', value: source_branch]]
                                                        }
                                                    }

            all_stages['packer_CentOS-8.2.2004'] = {
                                                        stage('Build packer-CentOS-8.2.2004')
                                                        {
                                                                build job: "packer/golden-baseos/centos8/CentOS-8.2.2004/build", parameters: [[$class: 'StringParameterValue', name: 'BUILD_BRANCH', value: source_branch]]
                                                        }
                                                    }

            all_stages['packer_CentOS-8.4.2105'] = {
                                                        stage('Build packer-CentOS-8.4.2105')
                                                        {
                                                                build job: "packer/golden-baseos/centos8/CentOS-8.4.2105/build", parameters: [[$class: 'StringParameterValue', name: 'BUILD_BRANCH', value: source_branch]]
                                                        }
                                                    }


    	stage('Build All Jobs')
    	{
    		parallel(all_stages)
    	}*/
}