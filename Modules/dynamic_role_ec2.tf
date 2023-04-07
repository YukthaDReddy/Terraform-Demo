# Create the IAM role
resource "aws_iam_role" "demo" {
  name = "demo-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach policies to the IAM role
resource "aws_iam_role_policy_attachment" "demo" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role = aws_iam_role.demo.name
}

# Create the instance profile
resource "aws_iam_instance_profile" "demo" {
  name = "demo-instance-profile"
  role = aws_iam_role.demo.name
}

# Launch the EC2 instance with the instance profile
resource "aws_instance" "demo" {
  ami ="${var.ami}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.availability_zones}"
  key_name= "Terraform-Demo"
  iam_instance_profile = aws_iam_instance_profile.demo.name
  tags = {
        Name = "Terraform Demo"
    }
}
