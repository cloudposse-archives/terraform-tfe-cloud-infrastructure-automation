package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
	}
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	environmentWorkspacesIds := terraform.OutputMapOfObjects(t, terraformOptions, "environment_workspaces_ids")
	globalWorkspaceId := terraform.Output(t, terraformOptions, "global_workspace_id")
	projectWorkspacesIds := terraform.OutputMapOfObjects(t, terraformOptions, "project_workspaces_ids")

	// Verify we're getting back the outputs we expect
	// Ensure we get a random number appended

  assert.Regexp(t, "^ws-\\w{16}$", globalWorkspaceId)
  if assert.NotEmpty(t, environmentWorkspacesIds) {
    assert.Regexp(t, "^ws-\\w{16}$", environmentWorkspacesIds["id"])

// 	  for _, item := range environmentWorkspacesIds {
//       assert.Regexp(t, "^ws-\\w{16}$", item)
// 		}
	}
  if assert.NotEmpty(t, projectWorkspacesIds) {
	  for _, item := range projectWorkspacesIds {
      assert.Regexp(t, "^ws-\\w{16}$", item)
		}
	}
}
