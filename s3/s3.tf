provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "yesPolicy" {
  bucket = "yesPolicyBucket"
}

resource "aws_s3_bucket_policy" "vulnS3BucketPolicy" {
  bucket = aws_s3_bucket.yesPolicy.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = "*"
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_s3_bucket" "noPolicy" {
  bucket = "noPolicyBucket"
}
