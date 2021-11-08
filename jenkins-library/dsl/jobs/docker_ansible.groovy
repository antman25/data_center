folder('build-root/docker-ansible')

pipelineJob('docker-ansible-build') {
    scm {
        git {
            remote {
                name('gitlab')
                url('http://gitlab.antlinux.local/antman/data_center.git')
            }
            extensions {
                cleanAfterCheckout()
                relativeTargetDirectory('data_center_download')
            }
        }
    }
}
