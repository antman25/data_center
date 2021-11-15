node()
{
    stage('ENV')
    {
        print("Params = ${params}")
        sh ('env | sort -n')
    }
    stage('Git Checkout')
    {
        //checkout scm
        checkout([$class: 'GitSCM', branches: [[name: "${params.BUILD_BRANCH}"]], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins_ssh', url: 'http://gitlab.antlinux.local:30080/antman/data_center.git']]])
    }

}