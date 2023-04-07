provider "aws"{
 region = "${var.region}"
}

resource "aws_instance" "ec2_pro" {
    availability_zone = "${var.availability_zones}"
    ami ="${var.ami}"
    # count = "${var.instance_count}"
    tags = {
        Name = "Terraform Demo"
        # Name = "Terraform-Demo-${count.index+1}"
    }
    instance_type = "${var.instance_type}"
    key_name= "Terraform-Demo"
}

# resource "aws_s3_bucket" "my-s3-bucket" {
#   bucket = "my-terraform-test-bucket-01032023"
#   count = "${var.instance_count}"
#   tags = {
#     Name = "Terraform-Demo-${count.index+1}"
#   }
# }