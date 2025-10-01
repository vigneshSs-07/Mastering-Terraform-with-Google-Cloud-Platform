>>> **Mastering Terraform with Google Cloud Platform: In-Depth Learning and Hands-On Labs** 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> TITLE: "Mastering Terraform with Google Cloud Platform  - Cloud SQL with Terraform"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, Data Engineer, Terraform, Python, PySpark, SQL, DevOps and BigData]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

https://developer.hashicorp.com/terraform/cli/init

## terraform init command

The terraform init command initializes a working directory containing Terraform configuration files. This is the first command you should run after writing a new Terraform configuration or cloning an existing configuration from version control. It is safe to run this command multiple times.

The following options apply to all of (or several of) the initialization steps:

-input=true Ask for input if necessary. If false, will error if input was required.

-lock=false Disable locking of state files during state-related operations.

-lock-timeout=<duration> Override the time Terraform will wait to acquire a state lock. The default is 0s (zero seconds), which causes immediate failure if the lock is already held by another process.

-no-color Disable color codes in the command output.

-upgrade Opt to upgrade modules and plugins as part of their respective installation steps. See the sections below for more details.


## terraform get command

Run the terraform get command to download and update modules declared in the root module.

The get command supports the following option:

-update - If specified, modules that are already downloaded will be checked for updates and the updates will be downloaded if present.

-no-color - Disable text coloring in the output.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>
