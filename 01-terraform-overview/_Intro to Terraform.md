>>> **Mastering Terraform with Google Cloud Platform: In-Depth Learning and Hands-On Labs** 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> TITLE: "Mastering Terraform with Google Cloud Platform  - Intro to Terraform"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, Data Engineer, Terraform, Python, PySpark, SQL, DevOps and BigData]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

https://spacelift.io/blog/what-is-terraform
https://developer.hashicorp.com/terraform/intro/core-workflow



## How Does Terraform Work?

At a high level, Terraform can be thought of as consisting of two main parts: Terraform Core and Plugins. Core is responsible for life cycle management of infrastructure. It is the open-source binary that you download and use from the command line. 

**Terraform Core** takes into consideration the current state and evaluates it against your desired configuration. It then proposes a plan to add or remove infrastructure components as needed. Next, it takes care of provisioning or decommissioning any resources if you choose to apply the plan.

**Terraform Plugins** provide a mechanism for Terraform Core to communicate with your infrastructure host or SaaS providers. Terraform Providers and Provisioners are examples of plugins as mentioned above. Terraform Core communicates with the plugins via Remote Procedure Call (RPC).


## Terraform Language

Infrastructure is defined in the Hashicorp Configuration Language (HCL) when working with Terraform. HCL is a declarative language targeted towards DevOps tools and servers. It provides a nice balance between machine-readable formats such as JSON and configuration formats included in high-level languages such as Ruby. 

Infrastructure components managed by Terraform are called Resources. Examples of resources include virtual machines, database tables, AWS S3 buckets, VPCs, and more. Each resource block in HCL helps define the resource and configure its properties. An example VPC resource looks like this:

```HCL
resource "aws_vpc" "default_vpc" { 
    cidr_block = "172.31.0.0/16" 
    tags = { 
        Name = "example_vpc" 
} }
```


Manage any infrastructure
Find providers for many of the platforms and services you already use in the Terraform Registry. You can also write your own. Terraform takes an immutable approach to infrastructure, reducing the complexity of upgrading or modifying your services and infrastructure.

Track your infrastructure
Terraform generates a plan and prompts you for your approval before modifying your infrastructure. It also keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment. Terraform uses the state file to determine the changes to make to your infrastructure so that it will match your configuration.

Automate changes
Terraform configuration files are declarative, meaning that they describe the end state of your infrastructure. You do not need to write step-by-step instructions to create resources because Terraform handles the underlying logic. Terraform builds a resource graph to determine resource dependencies and creates or modifies non-dependent resources in parallel. This allows Terraform to provision resources efficiently.

Standardize configurations
Terraform supports reusable configuration components called modules that define configurable collections of infrastructure, saving time and encouraging best practices. You can use publicly available modules from the Terraform Registry, or write your own.

Collaborate
Since your configuration is written in a file, you can commit it to a Version Control System (VCS) and use HCP Terraform to efficiently manage Terraform workflows across teams. HCP Terraform runs Terraform in a consistent, reliable environment and provides secure access to shared state and secret data, role-based access controls, a private registry for sharing both modules and providers, and more.










-----------------------------------------------------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>