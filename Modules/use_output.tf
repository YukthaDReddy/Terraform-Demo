data "terraform_remote_state" "example_bucket" {
  backend = "local"
  
  config = {
    path = "/path/to/first/configuration/terraform.tfstate"
  }
  
  outputs = ["bucket_arn"]
}

resource "aws_s3_bucket_policy" "example_policy" {
  bucket = "example-bucket"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${data.terraform_remote_state.example_bucket.bucket_arn}/*"
      }
    ]
  })
}
