variable "platform" {
  default     = "rhel"
  description = "The OS Platform"
}

variable "user" {
  description = "OS user that you log onto the Linux server as."
  default = "ec2-user"
}

# Packer-built AMI
variable "demoami" {
  description = "eCommerce Website AMI"
  default = "ami-05349ec17a04c40fb"
}

variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances."
  default     = "scarolan"
}

variable "domainname" {
  description = "Domain name you have configured in Route 53."
  default = "spacelyspacesprockets.info"
}

variable "subdomain" {
  default = "www"
  description = "Subdomain of your environment.  Example: dev1.spacelyspacesprockets.info"
}

variable "region" {
  description = "The region of AWS. Currently only supports us-west-2."
  default     = "us-west-2"
}

variable "ecommerce_servers" {
  description = "The number of demo ecommerce servers to launch."
  default = "1"
}

variable "ecommerce_instance_type" {
  default     = "t2.medium"
  description = "AWS Instance type, if you change, make sure it is compatible with AMI, not all AMIs allow all instance types "
}

variable "ecomTagName" {
  default     = "🚀 SpacelySprockets 🛸"
  description = "Name tag for the ecommerce servers"
}

variable "subnet0" {
  description = "Subnet to deploy instances into"
  default = "subnet-8ddab7d7"
}

variable "subnet1" {
  default = "subnet-82992cc9"
}

variable "subnet2" {
  default = "subnet-8ddab7d7"
}

variable "vpc_id" {
  type        = "string"
  description = "ID of the VPC to use"
  default     = "vpc-5dd7ff24"
}
