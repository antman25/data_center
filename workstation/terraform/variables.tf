variable "vsphere_user" {
type = string
description = "VMware vSphere user name"
}
variable "vsphere_password" {
type = string
description = "VMware vSphere password"
}
variable "vsphere_vcenter" {
type = string
description = "VMWare vCenter server FQDN / IP"
}
variable "vsphere_unverified_ssl" {
type = string
description = "Is the VMware vCenter using a self signed certificate (true/false)"
}
variable "vsphere_datacenter" {
type = string
description = "VMWare vSphere datacenter"
}
variable "vsphere_cluster" {
type = string
description = "VMWare vSphere cluster"
default = ""
}
variable "vsphere_template_folder" {
type = string
description = "Template folder"
default = "Templates"
}
#================================#
# VMware vSphere virtual machine #
#================================#
variable "vm_count" {
type = string
description = "Number of VM"
default     =  1
}
variable "vm_name_prefix" {
type = string
description = "Name of VM prefix"
default     =  "VMTemplate"
}
variable "vm_datastore" {
type = string
description = "Datastore used for the vSphere virtual machines"
}
variable "vm_network" {
type = string
description = "Network used for the vSphere virtual machines"
}
variable "vm_linked_clone" {
type = string
description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
default = "false"
}
variable "vm_cpu" {
type = string
description = "Number of vCPU for the vSphere virtual machines"
default = "2"
}
variable "vm_ram" {
type = string
description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
}
variable "vm_name" {
type = string
description = "The name of the vSphere virtual machines and the hostname of the machine"
}
variable "vm_guest_id" {
type = string
description = "The ID of virtual machines operating system"
}
variable "vm_template_name" {
type = string
description = "The template to clone to create the VM"
}
variable "vm_domain" {
type = string
description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
default = ""
}
