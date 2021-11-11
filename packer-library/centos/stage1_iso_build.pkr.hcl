
build {
  name = "stage01"
  sources = ["source.vsphere-iso.centos8_iso"]

  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    scripts         = ["scripts/stage01_cleanup.sh"]
  }
}
