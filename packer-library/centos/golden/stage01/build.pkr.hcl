
build {
  name = "stage01"
  sources = ["source.vsphere-iso.centos_iso"]

  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    inline = var.extra_commands
  }

  /*provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    scripts         = ["scripts/cleanup_centos7.sh"]
  }*/
}
