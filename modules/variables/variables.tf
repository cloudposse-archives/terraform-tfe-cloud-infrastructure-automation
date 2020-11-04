variable "category" {
  default     = "terraform"
  description = "Whether this is a Terraform or environment variable. Valid values are terraform or env."
}

variable "description" {
  default     = ""
  description = "Description of the variable."
}

variable "hcl" {
  default     = false
  description = "Whether to evaluate the value of the variable as a string of HCL code. Has no effect for environment variables. Defaults to false."
}

variable "sensitive" {
  default     = false
  description = "Whether the value is sensitive. If true then the variable is written once and not visible thereafter. Defaults to false."
}

variable "variables" {
  description = "Map of environment or Terraform variables to define in the workspace."
  default     = {}
}

variable "workspace_id" {
  description = "ID of the workspace that owns the variable."
}
