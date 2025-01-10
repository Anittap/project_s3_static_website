resource "aws_s3_bucket" "website" {
  bucket = "${var.environment}.${var.domain_name}"

  tags = {
    Name = "${var.project}-${var.environment}-bucket"
  }
}
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_policy" "public_bucket_policy" {
  bucket = aws_s3_bucket.website.id
  policy = data.template_file.s3_public_policy.rendered
}
resource "aws_s3_object" "website_file" {
    
  for_each     = fileset("../${var.website_dir}", "**/*")
  bucket       = aws_s3_bucket.website.bucket
  key          = each.key
  source       = "../${var.website_dir}/${each.key}"
  content_type = lookup(local.content_type_mapping, regex("\\.[^.]+$", each.key), null)
  etag         = filemd5("../${var.website_dir}/${each.value}")

}
