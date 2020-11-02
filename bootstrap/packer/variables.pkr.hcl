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
variable "iso_url" {
  type =  string
  sensitive = false
}
variable "iso_checksum" {
  type =  string
  sensitive = false
}
variable "cluster" {
  type =  string
  sensitive = false
}
variable "datacenter" {
  type =  string
  sensitive = false
}
variable "datastore" {
  type =  string
  sensitive = false
}
variable "folder" {
  type =  string
  sensitive = false
}
variable "iso_datastore" {
  type =  string
  sensitive = false
}
variable "iso_path" {
  type =  string
  sensitive = false
}
variable "network" {
  type =  string
  sensitive = false
}
variable "vsphere_server" {
  type =  string
  sensitive = false
}
variable "vsphere_user" {
  type =  string
  sensitive = false
}
variable "vsphere_password" {
  type =  string
  sensitive = false
}
variable "ssh_username" {
  type =  string
  sensitive = false
}
variable "ssh_password" {
  type =  string
  sensitive = true
}
