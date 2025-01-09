data "aws_route53_zone" "my_domain" {
  name         = var.domain_name
  private_zone = false
}
data "template_file" "s3_public_policy" {

  template = file("${path.module}/s3_public_policy.json")

  vars = {
    bucket_name = "${var.environment}.${var.domain_name}"
  }
}
