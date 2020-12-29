locals {
  # We compute the values ahead of time to deal with ternary type conversion issues.
  # The jsonencode / replaces below translate a JSON encoded string to proper HCL2
  variables = merge(var.variables, {
    for key, val in var.variables :
    key => replace(replace(jsonencode(val), "/(\".*?\"):/", "$1 = "), "/= null/", "= \"\"") if var.hcl
  })
}
resource "tfe_variable" "this" {
  for_each = local.variables

  category     = var.category
  hcl          = var.hcl
  key          = var.category == "env" ? "TF_VAR_${each.key}" : each.key
  sensitive    = var.sensitive
  value        = each.value
  workspace_id = var.workspace_id
}
