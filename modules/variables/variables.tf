variable "variables" {
  description = "Map of environment or Terraform variables to define in the workspace."
  default     = {}
  //type = map(object)
}

variable "hcl" {
  default = false
}

variable "workspace_id" {
  description = "ID of TFE Workspace"
}
