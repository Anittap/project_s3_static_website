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
  content_type_mapping = jsondecode(file("./mime.json"))
}
variable "website_dir" {
  type        = string
  description = "website directory name"
}
