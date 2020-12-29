resource "tfe_variable" "this" {
  for_each = var.variables

  category  = var.category
  hcl       = var.hcl
  key       = var.category == "env" ? "TF_VAR_${each.key}" : each.key
  sensitive = var.sensitive
  # translate a JSON encoded string to proper HCL2
  value        = replace(replace(jsonencode(each.value), "/(\".*?\"):/", "$1 = "), "/= null/", "= \"\"")
  workspace_id = var.workspace_id
}
