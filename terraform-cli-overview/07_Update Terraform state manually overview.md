>>> **Mastering Terraform with Google Cloud Platform: In-Depth Learning and Hands-On Labs** 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> TITLE: "Mastering Terraform with Google Cloud Platform  - Cloud SQL with Terraform"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, Data Engineer, Terraform, Python, PySpark, SQL, DevOps and BigData]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

https://developer.hashicorp.com/terraform/cli/state

Introduction
Terraform stores information about real-world object that correspond to resources in the configuration as state data. Doing so allows Terraform to modify an existing object when its resource declaration changes.

Terraform automatically updates state when you run the terraform plan and terraform apply commands, but you may need to manually adjustment state data as a result of changes to the configuration or the real managed infrastructure.

Workflow
Modifying state data outside of normal terraform plan or terraform apply operations can cause Terraform to lose track of managed resources, leading to increased costs, reduced productivity, or compromised security. Make sure to keep backups of your state data if you choose to manually modify state.

You can use the Terraform CLI to perform the following state interations:

Inspect state
Re-create resources
Move resources
Import existing resources
Recover state from backup


### Resource Address Reference

A resource address is a string that identifies zero or more resource instances in your overall configuration.

An address is made up of two parts:

```hcl
[module path][resource spec]
```



-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>