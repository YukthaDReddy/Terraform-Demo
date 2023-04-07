# s3.tf

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
}

output "bucket_arn" {
  value = aws_s3_bucket.example.arn
}
