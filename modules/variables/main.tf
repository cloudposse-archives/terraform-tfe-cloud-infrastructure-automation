resource "tfe_variable" "this" {
  for_each = var.variables

  category  = "terraform"
  key       = each.key
  value     = replace(replace(jsonencode(each.value), "/(\".*?\"):/", "$1 = "),"/= null/","= \"\"")
  sensitive = false
  hcl       = true

  workspace_id = var.workspace_id
}