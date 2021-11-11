
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
  sensitive = true
}
