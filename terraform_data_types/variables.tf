
#String attributes
resource "examplecloud_thing" "example" {
  example_attribute = "terraform"
}

variable "dataset_name" {
  type        = string
  default     = "demo_bq_dataset"
  description = "Name of BigQuery dataset"
}

variable "location" {
  type        = string
  default     = "us-east4"
  description = "Ideal location"
}

variable "gcs_bucket_name" {
  type        = string
  default     = "demo_gcs_bucket"
  description = "Name of GCS dataset"
}

#Boolean attributes
resource "examplecloud_thing" "example" {
  example_attribute = true
}

#Dynamic attribute
resource "examplecloud_thing" "example" {
  example_attribute = true
}

resource "examplecloud_thing" "example" {
  example_attribute = ["one", "two"]
}

resource "examplecloud_thing" "example" {
  example_attribute = {
    attr1 = "value1"
    attr2 = 123
  }
}

#Float32 attributes
resource "examplecloud_thing" "example" {
  example_attribute = 1.23
}

#Float64 attributes
resource "examplecloud_thing" "example" {
  example_attribute = 1.23
}

#Int32 attributes
resource "examplecloud_thing" "example" {
  example_attribute = 123
}

#Int64 attributes
resource "examplecloud_thing" "example" {
  example_attribute = 123
}

#List attributes
resource "examplecloud_thing" "example" {
  example_attribute = ["one", "two"]
}


#List nested attributes
resource "examplecloud_thing" "example" {
  example_attribute = [
    {
        attr = "one"
    },
    {
        attr = "two"
    },
  ]
}

#Map attributes
resource "examplecloud_thing" "example" {
  example_attribute = {
    "key1" = "value1"
    "key2" = "value2"
  }
}


#Map Nested Attribute
resource "examplecloud_thing" "example" {
  example_attribute = {
    "key1" = {
        attr = "one"
    },
    "key2" = {
        attr = "two"
    },
  }
}


#Number attributes
resource "examplecloud_thing" "example" {
  example_attribute = pow(2, 64) + 1
}


#Object attributes
resource "examplecloud_thing" "example" {
  example_attribute = {
    attr1 = "value1"
    attr2 = 123
  }
}

/*
#Maps/Objects
{
  name = "John"
  age  = 52
}
*/


#Set attributes
resource "examplecloud_thing" "example" {
  example_attribute = ["one", "two"]
}

variable "example_set" {
  type    = set(string)
  default = ["foo", "bar"]
}


#Set nested attributes
resource "examplecloud_thing" "example" {
  example_attribute = [
    {
        attr = "one"
    },
    {
        attr = "two"
    },
  ]
}


#Single nested attributes
resource "examplecloud_thing" "example" {
  example_attribute = {
    attr1 = "value1"
    attr2 = 123
  }
}



