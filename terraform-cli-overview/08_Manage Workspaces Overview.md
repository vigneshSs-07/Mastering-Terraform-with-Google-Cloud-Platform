>>> **Mastering Terraform with Google Cloud Platform: In-Depth Learning and Hands-On Labs** 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> TITLE: "Mastering Terraform with Google Cloud Platform  - Cloud SQL with Terraform"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, Data Engineer, Terraform, Python, PySpark, SQL, DevOps and BigData]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

https://developer.hashicorp.com/terraform/cli/workspaces

### Workspaces in the Terraform CLI refer to separate instances of state data inside the same Terraform working directory. They are distinctly different from workspaces in HCP Terraform, which each have their own Terraform configuration and function as separate working directories.

Terraform relies on state to associate resources with real-world objects. When you run the same configuration multiple times with separate state data, Terraform can manage multiple sets of non-overlapping resources.

Workspaces can be helpful for specific use cases, but they are not required to use the Terraform CLI. We recommend using alternative approaches for complex deployments requiring separate credentials and access controls.

Managing CLI Workspaces
Every initialized working directory starts with one workspace named default.

Use the terraform workspace list, terraform workspace new, and terraform workspace delete commands to manage the available workspaces in the current working directory.

Use the terraform workspace select command to change the currently selected workspace. For a given working directory, you can only select one workspace at a time. Most Terraform commands only interact with the currently selected workspace. This includes provisioning and state manipulation.

When you provision infrastructure in each workspace, you usually need to manually specify different input variables to differentiate each collection. For example, you might deploy test infrastructure to a different region.

### terraform workspace command
The terraform workspace command group helps you manage workspaces.

This command is a container for further subcommands that each have their own page in the documentation.
https://developer.hashicorp.com/terraform/cli/commands/workspace

###### terraform workspace list command
The terraform workspace list command lists all existing workspaces.

###### terraform workspace select command
The terraform workspace select selects a different workspace to use for further operations.

###### terraform workspace new command
The terraform workspace new command is used to create a new workspace.

###### terraform workspace delete command
The terraform workspace delete command deletes the specified workspace.

###### terraform workspace show command
The terraform workspace show command outputs the current workspace.




-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>