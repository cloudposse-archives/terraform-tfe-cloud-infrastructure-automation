locals {
  # We compute the values ahead of time to deal with ternary type conversion issues.
  values = {
    for key, val in var.variables :
    key => (var.hcl ? replace(replace(jsonencode(val), "/(\".*?\"):/", "$1 = "), "/= null/", "= \"\"") : val)
  }
}
resource "tfe_variable" "this" {
  for_each = var.variables

  category  = var.category
  hcl       = var.hcl
  key       = var.category == "env" ? "TF_VAR_${each.key}" : each.key
  sensitive = var.sensitive
  # translate a JSON encoded string to proper HCL2
  value        = local.values[each.key]
  workspace_id = var.workspace_id
}
