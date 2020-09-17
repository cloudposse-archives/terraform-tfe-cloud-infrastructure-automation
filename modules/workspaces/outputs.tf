output "top_level_id" {
  description = "The workspace's human-readable ID, which looks like `<ORGANIZATION>/<WORKSPACE>`."
  value       = tfe_workspace.top_level.id
}

output "workspace_ids" {
  description = "The workspace's human-readable ID, which looks like `<ORGANIZATION>/<WORKSPACE>`."
  value = local.workspace_ids
}

output "workspace_configuration" {
  value = local.workspace_configuration
}

output "globals_configuration" {
  value = local.workspace_globals
}

output "projects_configuration" {
  value = local.workspace_projects
}

output "workspace_globals" {
  value = local.id_globals_map
}

output "workspace_variables" {
  value = local.id_variables_map
}

output "workspace_triggers" {
  value = local.id_triggers_map
}