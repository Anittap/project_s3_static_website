region        = "us-east-1"
environment   = "development"
project       = "project_s3_static_website"
cidr_block    = "10.0.0.0/16"
newbits       = 4
backend_ports = ["80", "443"]
ssh_port      = "22"
lb_ports      = ["80", "443"]
