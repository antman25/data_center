node()
{
    stage('Git Checkout')
    {
        //checkout scm
        checkout([$class: 'GitSCM', branches: [[name: "${BUILD_BRANCH}"]], extensions: [], userRemoteConfigs: [[credentialsId: 'jenkins_ssh', url: 'http://gitlab.antlinux.local:30080/antman/data_center.git']]])
    }
}