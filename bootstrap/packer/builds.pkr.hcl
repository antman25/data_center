
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

# a build block invokes sources and runs provisionning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/from-1.5/blocks/build
#                         "sudo yum -y install net-tools",
#"sudo yum -y install yum-utils",
#"sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
#"sudo yum -y install docker-ce docker-ce-cli containerd.io",
#"sudo systemctl enable docker",
#"sudo curl -L http://10.0.0.164/scratch/downloads/utilities/docker-compose/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose",
#"sudo chmod +x /usr/local/bin/docker-compose",
#"sudo curl -L http://10.0.0.164/scratch/downloads/hashicorp/hashicorp_linux_bin_all.tar.gz -o /usr/local/bin/hashicorp.tar.gz",
#"cd /usr/local/bin/; sudo tar zxvf hashicorp.tar.gz",
#"sudo rm /usr/local/bin/hashicorp.tar.gz"
#
build {
  name = "stage01"
  sources = ["source.vsphere-iso.centos8-stage01"]


  #could not parse template for following block: "template: generated:2:37: executing \"generated\" at <.Vars>: can't evaluate field Vars in type struct { HTTPIP string; HTTPPort string }"
  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    inline          = [ "echo 'proxy=http://10.0.0.240:3128' >> /etc/dnf/dnf.conf",
                        "dnf -y update",
                        "dnf -y install python3",
                        "dnf -y install nfs-utils nfs4-acl-tools",
                        "alternatives --set python /usr/bin/python3",
                        "pip3 install ansible"

                    ]
  }
  provisioner "ansible-local" {
    playbook_file = "scripts/setup.yml"
  }

  #could not parse template for following block: "template: generated:2:37: executing \"generated\" at <.Vars>: can't evaluate field Vars in type struct { HTTPIP string; HTTPPort string }"
  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    scripts         = ["scripts/cleanup.sh"]
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
  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    inline          = [ "sudo yum -y install yum-utils",
                        "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
                        "sudo yum -y install docker-ce docker-ce-cli containerd.io",
                        "sudo systemctl enable docker",
                        "sudo curl -L http://10.0.0.164/scratch/downloads/utilities/docker-compose/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose",
                        "sudo chmod +x /usr/local/bin/docker-compose",
                      ]
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
  provisioner "shell" {
    execute_command = "echo 'packer'|{{.Vars}} sudo -S -E bash '{{.Path}}'"
    inline          = [ "sudo curl -L http://10.0.0.164/scratch/downloads/hashicorp/hashicorp_linux_bin_all.tar.gz -o /usr/local/bin/hashicorp.tar.gz",
                        "cd /usr/local/bin/; sudo tar zxvf hashicorp.tar.gz",
                        "sudo rm /usr/local/bin/hashicorp.tar.gz"

                      ]
  }
  provisioner "ansible-local" {
    playbook_file = "scripts/hashicorp.yml"
  }
  post-processor "manifest" {
    output = "stage03-manifest.json"
  }
}