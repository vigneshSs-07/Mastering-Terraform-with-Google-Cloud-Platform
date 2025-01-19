>>> **Mastering Terraform with Google Cloud Platform: In-Depth Learning and Hands-On Labs** 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> TITLE: "Mastering Terraform with Google Cloud Platform  - Cloud SQL with Terraform"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Data Engineer"
  >- Tags: [Google Cloud, Data Engineer, Terraform, Python, PySpark, SQL, DevOps and BigData]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


## Overview

1. In this lab, you will use Terraform to create, update, and destroy Google Cloud resources. 

2. You will start by defining Google Cloud as the provider.

3. You will then create a VM instance without mentioning the network to see how terraform parses the configuration code. 

4. You will then edit the code to add network and create a VM instance on Google Cloud. You will explore how to update the VM instance. You will edit the existing configuration to add tags and then edit the machine type. 

5. You will then execute terraform commands to destroy the resources created.


## Objectives

* In this lab you will learn how to perform the following tasks:

    * Verify Terraform installation

    * Define Google Cloud as the provider

    * Create, change, and destroy Google Cloud resources by using Terraform


### Task 1. Check Terraform Installation

* On the Google Cloud menu, click Activate Cloud Shell (Activate Cloud Shell). If a dialog box appears, click Continue. If prompted, click Continue.

* Confirm that Terraform is installed by running the following command:

     * terraform --version

### Task 2. Add Google Cloud provider

* Create the main.tf file:

     * touch main.tf

* Copy the following code in the main.tf file

* Switch to the Cloud Shell and run the terraform init command.

    * terraform init  # to download the plugins and initialize the provider

    * terraform validate # to validate the configs

    * terraform fmt # to format the content

    * terraform plan  # to generate the deployment plan ---input=false -var-file=default.tfvars

    * terraform apply # to auto-approve and deploy the changes to your project ----auto-approve -input=false -var-file=default.tfvars 


### Task 3. Build the infrastructure

* Let us try creating a compute instance without specifying the network parameter and see how terraform processes such configuration.Switch to the editor window. Within the main.tf file, enter the following code block.

* Save the main.tf file by clicking File > Save.


* Now run the following command to preview if the compute engine will be created.

     * terraform plan

* Apply the desired changes by running the following command.

     * terraform apply


### Task 4. Change the infrastructure

* In this task, we will be perform changes to the infrastructure:

    * Editing the machine-type

###### Adding tags to the compute resource

* Add a tags argument to the instance we just created so that it looks like this

* Run terraform plan

     * terraform plan

* Run terraform apply to update the instance

     * terraform apply

     - NOTE: The prefix ~ means that Terraform will update the resource in-place. 

###### Editing the machine type without stopping the VM

* Run terraform plan

     * terraform plan

* Run terraform apply to update the instance

     * terraform apply

     - NOTE: The terraform apply fails with a warning.

* The machine-type cannot be changed on a running VM. To ensure the VM stops before updating the machine_type, set allow_stopping_for_update argument to true so that the code looks like this:

* Run terraform plan

     * terraform plan

* Run terraform apply to update the instance

     * terraform apply

### Task 5. Destroy the infrastructure

* Execute the following command. Answer yes to execute this plan and destroy the infrastructure:

     * terraform destroy


--------------------------------------------------------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2024—2025 Cloud & AI Analytics. 
                                      All rights reserved
          </div>
