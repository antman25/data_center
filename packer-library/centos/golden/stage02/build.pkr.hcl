
build {
    name = "stage02"
    sources = [
        "source.vsphere-clone.centos8-stage02"
    ]

    provisioner "shell" {
        execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
        inline = var.extra_commands
    }

  /*provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    scripts         = ["scripts/cleanup_centos7.sh"]
  }*/
}
