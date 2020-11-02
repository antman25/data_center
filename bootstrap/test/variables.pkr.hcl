variable "sudo_password" {
  type =  string
  default = "mypasswordDEFAULT"
  // Sensitive vars are hidden from output as of Packer v1.6.5
  sensitive = true
}

variable "flavor" {
  type = string
  default = "flllava"
}

variable "exit_codes" {
  type = list(number)
  default = [0]
}

locals {
  ice_cream_flavor = "${var.flavor}-ice-cream"
  foo             = "bar"
}
