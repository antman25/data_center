source "vmware-iso" "basic-example" {
  iso_url = "http://mirrors.us.kernel.org/ubuntu-releases/20.10/ubuntu-20.10-desktop-amd64.iso"
  iso_checksum = "http://mirrors.us.kernel.org/ubuntu-releases/20.10/SHA256SUMS"
  ssh_username = "packer"
  ssh_password = "packer"
  shutdown_command = "shutdown -P now"
}

build {
  sources = ["sources.vmware-iso.basic-example"]
}
