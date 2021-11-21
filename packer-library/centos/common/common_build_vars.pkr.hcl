variable "build_branch" {
  type = string
  default = env("BUILD_BRANCH")
  sensitive = false
}

variable "role_id" {
  type = string
  default = env("BUILD_ROLE_ID")
  sensitive = false
}

variable "vm_stage_name" {
  type = list(string)
  default = ["Stage1-iso",
             "Stage2-osconfig",
             "Stage3-stig"]
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