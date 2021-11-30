node()
{
    def source_branch = env.getEnvironment().getOrDefault("gitlabSourceBranch", "main")
    gitlabCommitStatus(name: "test")
    {
        print("Test Build Status Sent")
    }


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
                        'jenkins-library/dsl/jobs/ubi8_hardened.groovy',
                        'jenkins-library/dsl/jobs/docker_ansible.groovy',
                          'jenkins-library/dsl/jobs/docker_terraform.groovy',
                          'jenkins-library/dsl/jobs/docker_consul.groovy',
                          'jenkins-library/dsl/jobs/docker_vault.groovy',
                          'jenkins-library/dsl/jobs/docker_packer.groovy',
                          'jenkins-library/dsl/jobs/packer_goldenos.groovy'].join('\n'),
         removedJobAction: 'DELETE',
         removedViewAction: 'DELETE',
         lookupStrategy: 'SEED_JOB',
         additionalParameters: params
    }

    all_stages = [:]

    all_stages = [:]
    all_stages['ansible'] = {
        stage('Build docker-ansible')
        {
            build job: "docker/ansible/build"
        }
    }

    all_stages['docker_terraform'] = {
        stage('Build docker-terraform')
        {
            build job: "docker/terraform/build"
        }
    }

    all_stages['docker_consul'] = {
            stage('Build docker-consul')
            {
                    build job: "docker/consul/build"
            }
    }

    all_stages['docker_vault'] = {
            stage('Build docker-vault')
            {
                    build job: "docker/vault/build"
            }
    }

    all_stages['docker_packer'] = {
            stage('Build docker-packer')
            {
                    build job: "docker/packer/build"
            }
    }

    stage('Build docker-ubi8-hardened')
    {
            build job: 'docker/ubi8/build'
    }

    stage('Build Docker Images')
    {
        parallel(all_stages)
    }

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

}