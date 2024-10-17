# Criação de um bucket S3
resource "aws_s3_bucket" "meu_bucket" {
  bucket = "nome-do-seu-bucket-teste-123123" # Substitua pelo nome desejado
  acl    = "private"            # Define o acesso como privado

  # Configurações adicionais (opcional)
  versioning {
    enabled = true               # Habilitar versionamento (opcional)
  }

  tags = {
    Name        = "Meu Bucket S3"
    Environment = "Dev"
  }
}

# Política de bloqueio de acesso público (opcional)
resource "aws_s3_bucket_public_access_block" "meu_bucket_block" {
  bucket = aws_s3_bucket.meu_bucket.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}
