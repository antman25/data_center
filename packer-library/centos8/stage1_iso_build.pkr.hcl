
build {
  name = "centos8"
  sources = ["source.vsphere-iso.centos8-stage01"]

  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    scripts         = ["scripts/stage01_cleanup.sh"]
  }
  post-processor "manifest" {
    output = "stage01-manifest.json"
  }
}
