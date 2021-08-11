variable "vm_name_iso" {
  type =  string
  default = "CentOS8-ISO-Template"
  sensitive = false
}
variable "vm_name" {
  type =  string
  default = "CentOS8-Template"
  sensitive = false
}
variable "vm_cpu_num" {
  type =  number
  default = 2
  sensitive = false
}
variable "vm_mem_size" {
  type = number
  default = 4096
  sensitive = false
}
variable "vm_disk_size" {
  type =  number
  default = 10240
  sensitive = false
}
variable "boot_wait" {
  type =  string
  default = "15s"
  sensitive = false
}
variable "cluster" {
  type =  string
  sensitive = false
}
variable "datacenter" {
  type =  string
  sensitive = false
  default = "ant-dc"
}
variable "datastore" {
  type =  string
  default = "terraform-test"
  sensitive = false
}
variable "folder" {
  type =  string
  default = "Templates/pipeline"
  sensitive = false
}
variable "iso_checksum" {
  type =  string
  default = "47dc26d76e566280cc47437fd2466134"
  sensitive = false
}
variable "iso_checksum_type" {
  type =  string
  default = "md5"
  sensitive = false
}
variable "iso_datastore" {
  type =  string
  default = "antlun"
  sensitive = false
}
variable "iso_path" {
  type =  string
  default = "ISO Images/centos/CentOS-8.2.2004-x86_64-dvd1.iso"
  sensitive = false
}
variable "network" {
  type =  string
  default = "VM Network"
  sensitive = false
}
variable "vsphere_server" {
  type =  string
  sensitive = false
  default = env("VSPHERE_SERVER")
}
variable "vsphere_user" {
  type =  string
  sensitive = false
}
variable "vsphere_password" {
  type =  string
  sensitive = true
}
variable "ssh_username" {
  type =  string
  sensitive = false
}
variable "ssh_password" {
  type =  string
  sensitive = true
}
