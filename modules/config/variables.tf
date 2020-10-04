variable "config_file_path" {
  default = null
  type    = string
}

variable "config_file_pattern" {
  default = "*.yaml"
}

variable "organization" {
  description = "Name of the organization."
}

variable "projects_path" {
  description = "Project directory repository-root-relative path"
  default     = "projects"
  type        = string
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {
  }
  type = map(string)
}
