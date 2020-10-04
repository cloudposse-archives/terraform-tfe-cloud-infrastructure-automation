output "config" {
  value = { for k, v in module.workspace : k => { workspace = v.workspace, variables = module.variables[k].variables, env_vars = module.env_vars[k].variables } }
}
