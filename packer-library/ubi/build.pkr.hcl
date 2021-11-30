build {
    name = "stage01"
    sources = ["source.docker.ubi8"]

    provisioner "shell" {
        inline = ["echo foo > /etc/anthony.txt"]
    }
    post-processors {

        post-processor "docker-tag" {
            repository = "nexus.antlinux.local:8443/hardened-base/ubi8/ubi"
            tags = ["8.4-213", "latest"]
        }

        post-processor "docker-push" {
            login = false
            login_username = "packer"
            login_password = "packer"
            login_server = "nexus.antlinux.local:8443"
        }
    }
}