variable "build_branch" {
  type = string
  default = env("BUILD_BRANCH")
  sensitive = false
}
