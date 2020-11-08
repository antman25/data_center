# =================== #
# Deploying VMware VM #
# =================== #
# Connect to VMware vSphere vCenter
provider "vsphere" {
user = var.vsphere_user
password = var.vsphere_password
vsphere_server = var.vsphere_vcenter
# If you have a self-signed cert
allow_unverified_ssl = var.vsphere_unverified_ssl
}
# Define VMware vSphere
data "vsphere_datacenter" "dc" {
name = var.vsphere_datacenter
}
data "vsphere_datastore" "datastore" {
name = var.vm_datastore
datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_compute_cluster" "cluster" {
name = var.vsphere_cluster
datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
name = var.vm_network
datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template" {
name = "/${var.vsphere_datacenter}/vm/${var.vsphere_template_folder}/${var.vm_template_name}"
datacenter_id = data.vsphere_datacenter.dc.id
}
# Create VMs
resource "vsphere_virtual_machine" "vm" {
count = var.vm_count
name = "${var.vm_name}-${count.index + 1}"
resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
datastore_id = data.vsphere_datastore.datastore.id
num_cpus = var.vm_cpu
memory = var.vm_ram
guest_id = var.vm_guest_id
wait_for_guest_net_timeout = -1
network_interface {
  network_id = data.vsphere_network.network.id
}
disk {
  label = "${var.vm_name}-${count.index + 1}-disk"
  size  = 25
}
clone {
  template_uuid = data.vsphere_virtual_machine.template.id
  customize {
    timeout = 0
    
    linux_options {
      host_name = "bootstrap-${count.index + 1}"
      domain = var.vm_domain
    }
    
    network_interface {
        ipv4_address = "10.0.0.${50 + count.index}"
        ipv4_netmask = 24
    }
  }
 }
}
