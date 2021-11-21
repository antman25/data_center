
variable "vsphere_server" {
  type =  string
  default = "vcenter.antlinux.local"
  sensitive = false
}
variable "vsphere_user" {
  type =  string
  default = "packer-svc@antlinux.local"
  sensitive = false
}
variable "vsphere_password" {
  type =  string
  default = env("VSPHERE_PASSWORD")
  sensitive = true
}

variable "datacenter" {
  type =  string
  default = "ant-dc"
  sensitive = false
}

variable "cluster" {
  type =  string
  default = "PrimaryCluster"
  sensitive = false
}

variable "folder" {
  type =  string
  default = "pipeline"
  sensitive = false
}

variable "datastore" {
  type =  string
  default = "terraform-test"
  sensitive = false
}

variable "network" {
  type =  string
  default = "VM Network"
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