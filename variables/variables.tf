variable "variables" {
  description = "Map of environment or Terraform variables to define in the workspace."
  default = {}
  //type = map(object)
}

variable "workspace_id" {
  description = "ID of TFE Workspace"
}

variable "hcl" {
  default = false
}