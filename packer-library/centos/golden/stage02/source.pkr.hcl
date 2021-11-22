source "vsphere-clone" "centos8-stage02" {
    convert_to_template  = false
    create_snapshot      = false
    datacenter           = var.datacenter
    datastore            = var.datastore
    cluster              = var.cluster
    folder               = local.vm_path
    template             = "${local.vm_prefix_name}--${var.vm_stage_name[0]}"

    vcenter_server       = var.vsphere_server
    username             = var.vsphere_user
    password             = var.vsphere_password
    vm_name              = "${local.vm_prefix_name}--${var.vm_stage_name[1]}"

    ssh_timeout          = "10m"
    ssh_username         = var.ssh_username
    ssh_password         = var.ssh_password
    RAM_reserve_all      = true

    insecure_connection = true

    export {
      force = true
      output_directory = "/tmp"
    }
}