
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

variable "os" {
  type = string
  default = "centos8"
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
