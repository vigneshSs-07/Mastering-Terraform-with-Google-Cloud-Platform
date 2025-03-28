

What is a map in Terraform?
In Terraform, a “map” is a data structure used to represent a collection of key-value pairs. It is similar to an object or dictionary in other programming languages. Maps are a fundamental data type in Terraform’s HashiCorp Configuration Language (HCL), which is used to define infrastructure as code (IaC) in Terraform.

Maps are commonly used in Terraform to store configuration data, define variables, and pass information between different parts of your code.

When defining your map variable, you can define the type annotation. The following types can be used to define your map:

map(string): The values in the map are of type “string.”
map(number): The values in the map are of type “number” (integer or floating-point).
map(bool): The values in the map are of type “bool” (true or false).
map(list): The values in the map are lists (arrays) containing elements of the same type.
map(set): The values in the map are sets containing unique elements of the same type.
map(object({ ... })): The values in the map are objects (complex data structures) that must conform to a specific structure defined by the object’s attributes.
What is the difference between map and object?
While maps and objects have similar syntax (both use curly braces {} and key-value pairs), their intended purposes and where they are typically used in Terraform are distinct.