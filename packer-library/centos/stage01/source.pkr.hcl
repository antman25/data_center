source "vsphere-iso" "centos_iso" {
	CPUs                 = "${var.vm_cpu_num}"
	RAM                  = "${var.vm_mem_size}"
	RAM_reserve_all      = false
	boot_command        = [var.boot_command]

	boot_order           = "disk,cdrom"
	//floppy_files       = ["ks/${var.kickstart_filename}"]
	http_content         = {
                               "/ks.cfg"     = file("ks/${var.kickstart_filename}")
                           }
	boot_wait            = "${var.boot_wait}"
	cluster              = "${var.cluster}"
	convert_to_template  = "false"
	create_snapshot      = "false"
	datacenter           = "${var.datacenter}"
	datastore            = "${var.datastore}"
	disk_controller_type = ["pvscsi"]
	folder               = "${local.vm_path}"
	guest_os_type        = "${var.guest_os_type}"
	insecure_connection  = "true"
	iso_checksum         = "${var.iso_checksum_type}:${var.iso_checksum}"
	
	iso_url	      = local.full_iso_url

	iso_target_path      = "packer_cache"
	network_adapters {
		network      = var.network
		network_card = "vmxnet3"
 	}
	password         = var.vsphere_password
	shutdown_command = "echo 'packer '|sudo -S shutdown -P now"
	ssh_username     = var.ssh_username
	ssh_password     = var.ssh_password
	ssh_timeout      = "10m"

	storage {
		disk_size             = "${var.vm_disk_size}"
		disk_thin_provisioned = true
	}
	username       = var.vsphere_user
	vcenter_server = var.vsphere_server
	vm_name        = "${local.vm_prefix_name}--${var.vm_stage_name[0]}"
	resource_pool  = "cluster"

	ip_wait_timeout = "10m"
}

