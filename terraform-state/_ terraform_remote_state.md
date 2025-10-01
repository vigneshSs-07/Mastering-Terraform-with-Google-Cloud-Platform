https://developer.hashicorp.com/terraform/language/state/remote-state-data

The terraform_remote_state Data Source

terraform_remote_state is a data source in Terraform that allows you to reference the root module outputs from another Terraform configuration (state file). It's a way to share data between separate Terraform configurations or state files.

Key Points About terraform_remote_state:
Purpose: Enables one Terraform configuration to read outputs from another Terraform state

Use Cases:

Sharing information between different environments (dev/stage/prod)

Breaking down large infrastructures into smaller, manageable components

Accessing outputs from a shared infrastructure component

Basic Syntax
hcl
Copy
data "terraform_remote_state" "example" {
  backend = "remote"  # or "s3", "azurerm", "gcs", etc.
  
  config = {
    # Backend-specific configuration
    organization = "company"
    workspaces = {
      name = "network"
    }
  }
}
Example Usage
hcl
Copy
data "terraform_remote_state" "vpc" {
  backend = "s3"
  
  config = {
    bucket = "my-terraform-state"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

# Reference outputs from the remote state
resource "aws_instance" "example" {
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_id
}
Backend Support
terraform_remote_state works with all standard Terraform backends:

S3

Azure Storage

Google Cloud Storage

Terraform Cloud/Enterprise

Local (for testing)

etc.

Important Notes
The configuration accessing the remote state needs appropriate permissions to read the state file

Changes in the source state won't automatically trigger updates in configurations using it

For better security, consider using state outputs instead of directly accessing resources

Modern Alternative
In Terraform Cloud/Enterprise, you might prefer using the remote backend with direct workspace references rather than the terraform_remote_state data source.