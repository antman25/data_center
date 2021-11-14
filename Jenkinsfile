node()
{
    stage('ENV')
    {
        sh ('env | sort -n')
    }
    stage('Git Checkout')
    {
        //checkout scm
        checkout([$class: 'GitSCM', branches: [[name: "${BRANCH_NAME}"]], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins_ssh', url: 'http://gitlab.antlinux.local:30080/antman/data_center.git']]])
    }
}