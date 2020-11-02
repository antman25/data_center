source "vsphere-iso" "centos8-template" {
  CPUs                 = 2
  RAM                  = 4096
  RAM_reserve_all      = true
  boot_command         = ["<tab><bs><bs><bs><bs><bs>text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>"]
  boot_order           = "disk,cdrom"
  boot_wait            = "{{ user `boot_wait` }}"
  cluster              = "{{user `cluster` }}"
  convert_to_template  = "true"
  datacenter           = "{{ user `datacenter` }}"
  datastore            = "antlun"
  disk_controller_type = ["pvscsi"]
  folder               = "{{ user `folder` }}"
  guest_os_type        = "centos8_64Guest"
  http_directory       = "http"
  insecure_connection  = "true"
  iso_checksum         = "{{ user `iso-checksum-type` }}:{{ user `iso-checksum` }}"
  iso_urls             = ["[antlun] ISO Images/centos/CentOS-8.2.2004-x86_64-dvd1.iso"]
  network_adapters {
    network      = "{{ user `network` }}"
    network_card = "vmxnet3"
  }
  password         = "{{ user `vcenter-password` }}"
  shutdown_command = "echo 'packer '|sudo -S /sbin/halt -h -p"
  ssh_password     = "{{ user `ssh-password` }}"
  ssh_timeout      = "30m"
  ssh_username     = "{{ user `ssh-username` }}"
  storage {
    disk_size             = 10240
    disk_thin_provisioned = true
  }
  username       = "{{ user `vcenter-username` }}"
  vcenter_server = "{{ user `vcenter-server` }}"
  vm_name        = "CentOS8-Template"
}
