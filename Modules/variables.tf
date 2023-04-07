variable "region" {
  description = "Region"
}

variable "availability_zones" {
  description = "Availability zones that are going to be used for the subnets"

}


variable "ami" {
    description = "ami id"
    type = string
}

variable "instance_type" {
    description = "instance_type t2.micro"
    type = string
}

variable "name" {
    description = "instance_type t2.micro"
    type = string
    default = "Terraform-Test"

}

# variable "instance_count"{
#   description = "Number of instances to be created"
#   default = "1"
# }
