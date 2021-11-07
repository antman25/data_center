vsphere_server = "vcenter.antlinux.local"
vsphere_user = "packer-svc@antlinux.local"
ssh_username = "packer"
ssh_password = "packer"

cluster = "PrimaryCluster"

playbooks = [
  {
    environment_variables = []
    name = "inf-platform-autoconfig"
    path = "/opt/playbooks/inf-platform/packer-playbook.yml"
    extra_arguments = ""
  }
]

extra_commands = [
  "set -x",
  "yum install docker-ce playbook-isi-autoconfig playbook-unity-autoconfig standalone-artifactory -y",
  "yum install vault vault-init-ca  -y"
]
