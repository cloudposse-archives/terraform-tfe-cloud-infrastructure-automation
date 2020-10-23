variable "config_name" {
  type = string
}

variable "global_values" {
  type = any
}

variable "projects" {
  type = any
}

variable "projects_path" {
  default = "projects"
  type    = string
}

variable "organization" {
  description = "Name of the organization."
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {
  }
  type = map(string)
}
