resource "aws_s3_bucket" "website" {
  bucket = "${var.environment}.${var.domain_name}"

  tags = {
    Name = "${var.project}-${var.environment}-bucket"
  }
}
