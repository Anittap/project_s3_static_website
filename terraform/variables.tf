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
variable "domain_name" {
  type        = string
  description = "domain name"
}
locals {
  content_type_mapping = file("./mime.json")
}
