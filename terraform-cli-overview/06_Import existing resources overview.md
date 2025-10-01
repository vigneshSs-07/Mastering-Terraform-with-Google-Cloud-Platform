>>> **Mastering Terraform with Google Cloud Platform: In-Depth Learning and Hands-On Labs** 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> TITLE: "Mastering Terraform with Google Cloud Platform  - Cloud SQL with Terraform"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, Data Engineer, Terraform, Python, PySpark, SQL, DevOps and BigData]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

https://developer.hashicorp.com/terraform/cli/import

Workflows
You can import an existing resource to state from the Terraform CLI. You can also perform import operations using HCP Terraform. To import multiple resources, use the import block.

Import to state
Before you run terraform import you must manually write a resource configuration block for the resource. The resource block describes where Terraform should map the imported object.

The terraform import CLI command can only import resources into the state. Importing via the CLI does not generate configuration. If you want to generate the accompanying configuration for imported resources, use the import block instead.

Terraform expects each remote object to be bound to a single resource address. You should import each remote object to one Terraform resource address. Importing the same object multiple times may result in unwanted behavior. Refer to State for more details.

HCP Terraform
When you use Terraform on the command line with HCP Terraform, commands such as apply run inside your HCP Terraform environment. However, the import command runs locally, so it does not have access to information from HCP Terraform. To successfully perform an import, you may need to set local variables equivalent to any remote workspace variables in HCP Terraform.

Import multiple resources
You can specify multiple resources in the import block to import more than one resource at a time. You can also review imports as part of your normal plan and apply workflow. Refer to the import block reference in the Terraform configuration language documentation for addtitional information.

Resource importability
Each resource in Terraform must implement some basic logic to become importable. As a result, you cannot import all Terraform resources.

The resources that you can import are documented at the bottom of each resource documentation page in the Terraform Registry. If you have issues importing a resource, report an issue in the relevant provider repository.


The terraform import command imports existing resources into Terraform. Refer to Import for additional information.

The command-line flags are all optional. The following flags are available:

-config=path - Path to directory of Terraform configuration files that configure the provider for import. This defaults to your working directory. If this directory contains no Terraform configuration files, the provider must be configured via manual input or environmental variables.

-input=true - Whether to ask for input for provider configuration.

-lock=false - Don't hold a state lock during the operation. This is dangerous if others might concurrently run commands against the same workspace.

-lock-timeout=0s - Duration to retry a state lock.

-no-color - If specified, output won't contain any color.

-parallelism=n - Limit the number of concurrent operations as Terraform walks the graph. Defaults to 10.

-provider=provider - Deprecated Override the provider configuration to use when importing the object. By default, Terraform uses the provider specified in the configuration for the target resource, and that is the best behavior in most cases.

-var 'foo=bar' - Set a variable in the Terraform configuration. This flag can be set multiple times. Variable values are interpreted as literal expressions in the Terraform language, so list and map values can be specified via this flag.

-var-file=foo - Set variables in the Terraform configuration from a variable file. If terraform.tfvars or any .auto.tfvars files are present in the current directory, they are automatically loaded. Terraform loads terraform.tfvars first and the .auto.tfvars files after in alphabetical order. Any files specified by -var-file override any values set automatically from files in the working directory. This flag can be used multiple times. This is only useful with the -config flag.





-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>