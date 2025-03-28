

#https://spacelift.io/blog/how-to-use-terraform-variables#what-are-terraform-variables


```

locals {
 ami  = "ami-0d26eb3972b7f8c96"
 type = "t2.micro"
 tags = {
   Name = "My Virtual Machine"
   Env  = "Dev"
 }
 subnet = "subnet-76a8163a"
 nic    = aws_network_interface.my_nic.id
}
 
resource "aws_instance" "myvm" {
 ami           = local.ami
 instance_type = local.type
 tags          = local.tags
 
 network_interface {
   network_interface_id = aws_network_interface.my_nic.id
   device_index         = 0
 }
}
 
resource "aws_network_interface" "my_nic" {
 description = "My NIC"
 subnet_id   = var.subnet
 
 tags = {
   Name = "My NIC"
 }
}

```