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
  default = "15s"
  sensitive = false
}

variable "boot_command" {
  type = string
  sensitive = false
}


