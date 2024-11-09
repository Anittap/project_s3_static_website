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
variable "newbits" {
  type        = number
  description = "Bits to add to subnet"
}
variable "backend_ports" {
  type        = list(string)
  description = "backend server ports"
}
variable "lb_ports" {
  type        = list(string)
  description = "load balancer ports"
}
variable "ssh_port" {
  type        = string
  description = "ssh port for backend"
}
locals {
  content_type_mapping = file("./mime.json")
}
