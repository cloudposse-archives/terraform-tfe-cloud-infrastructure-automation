<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.2 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | >= 0.23.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfc_config"></a> [tfc\_config](#module\_tfc\_config) | ./modules/workspaces | n/a |
| <a name="module_tfc_environment"></a> [tfc\_environment](#module\_tfc\_environment) | ./modules/environment | n/a |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.22.1 |

## Resources

| Name | Type |
|------|------|
| [tfe_run_trigger.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/run_trigger) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_config_auto_apply"></a> [config\_auto\_apply](#input\_config\_auto\_apply) | Controls Terraform Cloud workspace auto-apply feature | `bool` | `true` | no |
| <a name="input_config_file_path"></a> [config\_file\_path](#input\_config\_file\_path) | Relative path to YAML config files | `string` | `null` | no |
| <a name="input_config_file_pattern"></a> [config\_file\_pattern](#input\_config\_file\_pattern) | File pattern used to locate configuration files | `string` | `"*.yaml"` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | <pre>object({<br>    enabled             = bool<br>    namespace           = string<br>    environment         = string<br>    stage               = string<br>    name                = string<br>    delimiter           = string<br>    attributes          = list(string)<br>    tags                = map(string)<br>    additional_tag_map  = map(string)<br>    regex_replace_chars = string<br>    label_order         = list(string)<br>    id_length_limit     = number<br>  })</pre> | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_order": [],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters.<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the organization. | `string` | n/a | yes |
| <a name="input_projects_path"></a> [projects\_path](#input\_projects\_path) | Project directory path relative to the repository root | `string` | `"projects"` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to use for this workspace. Defaults to the latest available version. | `string` | `null` | no |
| <a name="input_tfc_project_path"></a> [tfc\_project\_path](#input\_tfc\_project\_path) | Name of the working directory where the top-level Terraform Cloud project resides (e.g. within `projects_path`). | `string` | `"tfc"` | no |
| <a name="input_top_level_workspace"></a> [top\_level\_workspace](#input\_top\_level\_workspace) | Name of the top-level configuration workspace in Terraform Cloud | `string` | `"tfc-config"` | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | The VCS repository to configure. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment_workspaces"></a> [environment\_workspaces](#output\_environment\_workspaces) | A list of environment workspaces & their configurations. |
| <a name="output_global_workspace"></a> [global\_workspace](#output\_global\_workspace) | Configuration information for the global workspace. |
| <a name="output_project_workspaces"></a> [project\_workspaces](#output\_project\_workspaces) | A list of project workspaces & their configurations. |
<!-- markdownlint-restore -->
