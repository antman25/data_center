source "vsphere-iso" "centos8-stage01" {
  CPUs                 = "${var.vm_cpu_num}"
  RAM                  = "${var.vm_mem_size}"
  RAM_reserve_all      = true
  boot_command         = ["<tab><bs><bs><bs><bs><bs>text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>"]
  boot_order           = "disk,cdrom"
  boot_wait            = "${var.boot_wait}"
  cluster              = "${var.cluster}"
  convert_to_template  = "true"
  create_snapshot      = "false"
  datacenter           = "${var.datacenter}"
  datastore            = "${var.datastore}"
  disk_controller_type = ["pvscsi"]
  folder               = "${var.folder}"
  guest_os_type        = "centos8_64Guest"
  http_directory       = "http"
  insecure_connection  = "true"
  iso_checksum         = "${var.iso_checksum_type}:${var.iso_checksum}"
  #iso_urls             = ["[${var.iso_datastore}] ${var.iso_path}"
  #                       ]
  iso_url	       = "file:///mnt/scratch/downloads/iso/CentOS-8.2.2004-x86_64-dvd1/CentOS-8.2.2004-x86_64-dvd1.iso"

  #iso_paths            = [ "[${var.iso_datastore}] ${var.iso_path}" ]
  iso_target_path      = "packer_test_cache"
  network_adapters {
    network      = "${var.network}"
    network_card = "vmxnet3"
  }
  password         = "${var.vsphere_password}"
  shutdown_command = "echo 'packer '|sudo -S /sbin/halt -h -p"
  ssh_username     = "${var.ssh_username}"
  ssh_password     = "${var.ssh_password}"
  ssh_timeout      = "30m"

  storage {
    disk_size             = "${var.vm_disk_size}"
    disk_thin_provisioned = true
  }
  username       = "${var.vsphere_user}"
  vcenter_server = "${var.vsphere_server}"
  vm_name        = "CentOS8-Stage01"

  export {
    force = true
    output_directory = "./output_vsphere"
  }

  #content_library_destination {
  #   library = "pipeline_lib"
  #   ovf = true
  #}
}

source "vsphere-clone" "centos8-stage02" {
  convert_to_template  = "false"
  create_snapshot      = "false"
  datacenter           = "${var.datacenter}"
  datastore            = "${var.datastore}"
  cluster              = "${var.cluster}"
  folder               = "${var.folder}"
  template             = "CentOS8-Stage01"

  vcenter_server       = "${var.vsphere_server}"
  username             = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"
  vm_name              = "CentOS8-Stage02"

  ssh_timeout          = "30m"
  ssh_username         = "${var.ssh_username}"
  ssh_password         = "${var.ssh_password}"
  RAM_reserve_all      = true

  insecure_connection = "true"
}

source "vsphere-clone" "centos8-stage03" {
  convert_to_template  = "false"
  create_snapshot      = "false"
  datacenter           = "${var.datacenter}"
  datastore            = "${var.datastore}"
  cluster              = "${var.cluster}"
  folder               = "${var.folder}"
  template             = "CentOS8-Stage02"

  vcenter_server = "${var.vsphere_server}"
  username       = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vm_name        = "${var.vm_name}"

  ssh_timeout      = "30m"
  ssh_username     = "${var.ssh_username}"
  ssh_password     = "${var.ssh_password}"
  RAM_reserve_all      = true

  insecure_connection = "true"
}
