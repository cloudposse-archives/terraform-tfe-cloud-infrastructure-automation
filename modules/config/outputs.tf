output "workspace_ids" {
  value = local.workspace_ids
}

output "workspace_globals" {
  value = local.workspace_globals
}

output "workspace_variables" {
  value = local.workspace_variables
}

output "workspace_triggers" {
  value = local.workspace_triggers
}

// output "workspace_configuration" {
//   value = module.workspace.*.workspace_configuration
// }

// output "top_level_external_ids" {
//    value = { for p in local.infrastructure_files : p => module.tfc_workspace[p].top_level_external_id }
// }

// output "top_level_ids" {
//    value = { for p in local.infrastructure_files : p => module.tfc_workspace[p].top_level_id }
// }

// output "sub_project_external_ids" {
//    value = { for p in local.infrastructure_files : p => module.tfc_workspace[p].sub_project_external_id }
// }

// output "globals_configuration" {
//    value = { for p in local.infrastructure_files : p => module.tfc_workspace[p].globals_configuration }
// }

// output "projects_configuration" {
//    value = { for p in local.infrastructure_files : p => module.tfc_workspace[p].projects_configuration}
// }


// output "workspace_configuration" {
//    value = { for p in local.infrastructure_files : p => module.tfc_workspace[p].workspace_configuration }
// }