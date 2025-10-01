>>> **Mastering Terraform with Google Cloud Platform: In-Depth Learning and Hands-On Labs** 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> TITLE: "Mastering Terraform with Google Cloud Platform  - Cloud SQL with Terraform"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, Data Engineer, Terraform, Python, PySpark, SQL, DevOps and BigData]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
https://developer.hashicorp.com/terraform/cli/inspect


Terraform configurations and state data include some highly structured information about the resources they manage; this includes dependency information, outputs (which are pieces of generated or discovered data that the configuration's author considers important enough to surface to users), and more.

Terraform CLI includes some commands for inspecting or transforming this data. You can use these to integrate other tools with Terraform's infrastructure data, or just to gain a deeper or more holistic understanding of your infrastructure.

1. The **terraform graph command** creates a visual representation of a configuration or a set of planned changes.
https://developer.hashicorp.com/terraform/cli/commands/graph 

2. The **terraform output command** can get the values for the top-level output values of a configuration, which are often helpful when making use of the infrastructure Terraform has provisioned.
https://developer.hashicorp.com/terraform/cli/commands/output

3. The **terraform show command** can generate human-readable versions of a state file or plan file, or generate machine-readable versions that can be integrated with other tools.
https://developer.hashicorp.com/terraform/cli/commands/show 

4. The **terraform state list command** can list the resources being managed by the current working directory and workspace, providing a complete or filtered list.The terraform state list command lists resources within a Terraform state.
https://developer.hashicorp.com/terraform/cli/commands/state/list


5. The **terraform state show** command can print all of the attributes of a given resource being managed by the current working directory and workspace, including generated read-only attributes like the unique ID assigned by the cloud provider.
The terraform state show command shows the attributes of a single resource in the Terraform state.
https://developer.hashicorp.com/terraform/cli/commands/state/show 


-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>