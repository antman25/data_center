
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

build {
  name = "stage01"
  sources = ["source.vsphere-iso.centos8-stage01"]

  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    inline          = [ "dnf -y update",
                        "dnf -y install python3",
                        "alternatives --set python /usr/bin/python3",
                        "pip3 install ansible"
                    ]
  }
  provisioner "ansible-local" {
    playbook_file = "scripts/stage01_baseos.yml"
  }

  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    scripts         = ["scripts/stage01_cleanup.sh"]
  }
  post-processor "manifest" {
    output = "stage01-manifest.json"
  }
}

build {
  name = "stage02"
  sources = [
    "source.vsphere-clone.centos8-stage02"
  ]
  provisioner "ansible-local" {
    playbook_file = "scripts/stage02_docker.yml"
  }

  post-processor "manifest" {
    output = "stage02-manifest.json"
  }
}

build {
  name = "stage03"
  sources = [
    "source.vsphere-clone.centos8-stage03"
  ]

  provisioner "ansible-local" {
    playbook_file = "scripts/stage03_common.yml"
  }
  provisioner "ansible-local" {
    playbook_file = "scripts/stage03_consul.yml"
  }
  provisioner "ansible-local" {
    playbook_file = "scripts/stage03_vault.yml"
  }
  provisioner "ansible-local" {
    playbook_file = "scripts/stage03_nomad.yml"
  }
  post-processor "manifest" {
    output = "stage03-manifest.json"
  }
}