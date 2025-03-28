variable "bucket_prefix" {
  type    = string
  default = "mybucketname"
}

locals {
  bucket_name = "${var.bucket_prefix}-bucket1"
}
 
resource "aws_s3_bucket" "my_test_bucket" {
  bucket = local.bucket_name
  acl    = "private"
}



locals {
  resource_tags = {
    project_name = "mytest",
    category     = "devresource"
  }
}
 
resource "aws_iam_role" "myrole" {
  name = "my_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "s3.amazonaws.com"
        }
      },
    ]
  })
 
  tags = local.resource_tags
}


#In this below example, the local value is being merged with a Terraform variable value. The merged value is used in the script. The output value is also defined to output the tag values:  

variable "res_tags" {
  type = map(string)
  default = {
    dept = "finance",
    type = "app"
  }
}
 
locals {
  all_tags = {
    env       = "dev",
    terraform = true
  }
  applied_tags = merge(var.res_tags, local.all_tags)
}
 
 
resource "aws_s3_bucket" "tagsbucket" {
  bucket = "tags-bucket"
  acl    = "private"
 
  tags = local.applied_tags
}
 
 
output "out_tags" {
  value = local.applied_tags
}