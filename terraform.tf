terraform {
  backend "s3" {
    bucket = "staticsitestatefile"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

