data "aws_route53_zone" "my_domain" {
  name         = var.domain_name
  private_zone = false
}
