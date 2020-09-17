variable "runtriggers" {
  description = "Map of Run Triggers for Terraform Enterprise"
  default = {}
}

variable "workspace_id" {
  description = "ID of TFE Workspace"
}

variable "workspace_ids" {
    description = "Map of All TFE Workspace IDs"
}