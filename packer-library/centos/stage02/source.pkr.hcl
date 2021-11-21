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