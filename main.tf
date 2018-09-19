##############################################################################
# HashiCorp Terraform ACM Demo
##############################################################################

provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "spacelysprockets" {
  ami                    = "${var.demoami}"
  instance_type          = "${var.ecommerce_instance_type}"
  key_name               = "${var.key_name}"
  count                  = "${var.ecommerce_servers}"
  vpc_security_group_ids = ["${aws_security_group.ecommerce_sg.id}"]

  # This places all machines in one subnet.
  subnet_id = "${var.subnet0}"

  tags {
    Name  = "${var.ecomTagName}-${var.subdomain}-${count.index}"
    owner = "team-se@hashicorp.com"
    TTL   = "8"
  }

}

resource "aws_security_group" "ecommerce_sg" {
  name        = "ecommerce_sg_${var.subdomain}"
  description = "Ecommerce website security group"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name = "${var.subdomain}-sg"
  }

  # These are for internal traffic
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "udp"
    self      = true
  }

  # HTTP traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS traffic
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # For remote access via SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # This is for outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
