resource "tfe_run_trigger" "this" {
  for_each = length(var.runtriggers) > 0 ? toset(var.runtriggers) : []

  workspace_id  = var.workspace_id
  sourceable_id = lookup(var.workspace_ids, each.value)
}