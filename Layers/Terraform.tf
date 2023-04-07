module "role_ec2" {
  source = "../Modules"
  region = "us-west-2"
  availability_zones = "us-west-2a"
  ami = "ami-094125af156557ca2"
  instance_type = "t2.micro"
  # instance_count = "5"
}
