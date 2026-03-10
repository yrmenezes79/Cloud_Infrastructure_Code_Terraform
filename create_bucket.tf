resource "aws_s3_bucket" "meu_bucket" {
  bucket = "nome1-do-seu-bucket-teste-123123"

  tags = {
    Name        = "Meu Bucket S3"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_versioning" "meu_bucket_versioning" {
  bucket = aws_s3_bucket.meu_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_public_access_block" "meu_bucket_block" {
  bucket = aws_s3_bucket.meu_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
