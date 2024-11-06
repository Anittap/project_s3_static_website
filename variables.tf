variable "region" {
  type        = string
  description = "aws region name"
}
variable "environment" {
  type        = string
  description = "project environment name"
}
variable "project" {
  type        = string
  description = "project name"
}
variable "cidr_block" {
  type        = string
  description = "vpc cdr block"
}

