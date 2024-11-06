resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project}-${var.environment}"
  }
}
resource "aws_subnet" "public" {
  count                   = 3
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, var.newbits, count.index)
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.default.names[count.index]

  tags = {
    Name = "${var.project}-${var.environment}-public-${count.index + 1}"
  }
}
resource "aws_subnet" "private" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, var.newbits, count.index + 3)
  availability_zone = data.aws_availability_zones.default.names[count.index]

  tags = {
    Name = "${var.project}-${var.environment}-private-${count.index + 1}"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-${var.environment}"
  }
}
resource "aws_eip" "nat" {
  domain = "vpc"
}
