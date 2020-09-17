resource "tfe_variable" "this" {
  for_each = var.variables

  category  = "terraform"
  key       = each.key
  value     = jsonencode(each.value)
  sensitive = false
  hcl       = true

  workspace_id = var.workspace_id
}