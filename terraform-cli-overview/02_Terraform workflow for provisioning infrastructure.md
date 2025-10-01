>>> **Mastering Terraform with Google Cloud Platform: In-Depth Learning and Hands-On Labs** 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> TITLE: "Mastering Terraform with Google Cloud Platform  - Cloud SQL with Terraform"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, Data Engineer, Terraform, Python, PySpark, SQL, DevOps and BigData]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


You can use Terraform to create, modify, and destroy infrastructure resources to match the desired state described in a Terraform configuration. The Terraform binary includes commands and subcommands for a wide variety of infrastructure lifecycle management actions, but the following commands provide basic provisioning tasks:

terrafrom plan
terraform apply
terraform destroy


## Plan
The terraform plan command evaluates a Terraform configuration to determine the desired state of all the resources it declares, then compares that desired state to the real infrastructure objects being managed with the current working directory and workspace. It uses state data to determine which real objects correspond to which declared resources, and checks the current state of each resource using the relevant infrastructure provider's API.

Once it has determined the difference between the current state and the desired state, terraform plan presents a description of the changes necessary to achieve the desired state. It does not perform any actual changes to real world infrastructure objects; it only presents a plan for making changes.

Plans are usually run to validate configuration changes and confirm that the resulting actions are as expected. However, terraform plan can also save its plan as a runnable artifact, which terraform apply can use to carry out those exact changes.

https://developer.hashicorp.com/terraform/cli/commands/plan#terraform-plan-command

## Apply

The terraform apply command performs a plan just like terraform plan does, but then actually carries out the planned changes to each resource using the relevant infrastructure provider's API. It asks for confirmation from the user before making any changes, unless it was explicitly told to skip approval.

By default, terraform apply performs a fresh plan right before applying changes, and displays the plan to the user when asking for confirmation. However, it can also accept a plan file produced by terraform plan in lieu of running a new plan. You can use this to reliably perform an exact set of pre-approved changes, even if the configuration or the state of the real infrastructure has changed in the minutes since the original plan was created.

https://developer.hashicorp.com/terraform/cli/commands/apply

## Destroy

The terraform destroy command destroys all of the resources being managed by the current working directory and workspace, using state data to determine which real world objects correspond to managed resources. Like terraform apply, it asks for confirmation before proceeding.

A destroy behaves exactly like deleting every resource from the configuration and then running an apply, except that it doesn't require editing the configuration. This is more convenient if you intend to provision similar resources at a later date.


https://developer.hashicorp.com/terraform/cli/commands/destroy







-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>