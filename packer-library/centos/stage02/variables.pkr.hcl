variable "vm_cpu_num" {
  type =  number
  default = 1
  sensitive = false
}

variable "vm_mem_size" {
  type = number
  default = 4096
  sensitive = false
}

variable "vm_disk_size" {
  type =  number
  default = 25600
  sensitive = false
}

variable "boot_wait" {
  type =  string
  default = "10s"
  sensitive = false
}

variable "boot_command" {
  type = string
  sensitive = false
}

variable "repo_username" {
  type =  string
  sensitive = false
}
variable "repo_password" {
  type =  string
  sensitive = true
}

variable "repo_scheme" {
  type = string
  default = "https"
  sensitive = false
}

variable "repo_iso_base_url" {
  type =  string
  default = "nexus.antlinux.local:8443/repository/generic-vendor/iso/"
  sensitive = false
}

variable "repo_iso_filepath" {
  type = string
  sensitive = false
}

variable "guest_os_type" {
  type = string
  default = "centos64Guest"
  sensitive = false
}

variable "os" {
  type = string
  default = "centos"
  sensitive = false
}

variable "os_version" { 
  type = string 
  sensitive = false
}

variable "iso_checksum_type" {
  type = string
  default = "md5"
  sensitive = false
}

variable "iso_checksum" {
  type = string
  sensitive = false
}

variable "kickstart_filename" {
  type = string
  default = "ks.cfg"
  sensitive = false
}

variable "extra_commands" {
  type    = list(string)
  default = ["echo 'No Extra Commands'"]
}
