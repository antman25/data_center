source "vsphere-iso" "centos8-template" {
  CPUs                 = "${var.vm_cpu_num}"
  RAM                  = "${var.vm_mem_size}"
  RAM_reserve_all      = true
  boot_command         = ["<tab><bs><bs><bs><bs><bs>text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>"]
  boot_order           = "disk,cdrom"
  boot_wait            = "${var.boot_wait}"
  cluster              = "${var.cluster}"
  convert_to_template  = "true"
  create_snapshot      = "true"
  datacenter           = "${var.datacenter}"
  datastore            = "antlun"
  disk_controller_type = ["pvscsi"]
  folder               = "${var.folder}"
  guest_os_type        = "centos8_64Guest"
  http_directory       = "http"
  insecure_connection  = "true"
  iso_checksum         = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_urls             = ["[antlun] ISO Images/centos/CentOS-8.2.2004-x86_64-dvd1.iso",
                          "[${var.iso_datastore}] ${var.iso_path}",
                          "http://10.0.0.164/scratch/downloads/iso/CentOS-8.2.2004-x86_64-dvd1/CentOS-8.2.2004-x86_64-dvd1.iso"
                         ]
  network_adapters {
    network      = "${var.network}"
    network_card = "vmxnet3"
  }
  password         = "${var.vsphere_password}"
  shutdown_command = "echo 'packer '|sudo -S /sbin/halt -h -p"
  ssh_password     = "${var.ssh_password}"
  ssh_timeout      = "30m"
  ssh_username     = "${var.ssh_username}"
  storage {
    disk_size             = "${var.vm_disk_size}"
    disk_thin_provisioned = true
  }
  username       = "${var.vsphere_user}"
  vcenter_server = "${var.vsphere_server}"
  vm_name        = "${var.vm_name}"
}
