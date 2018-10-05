#####################################################################
##
##      Created 10/4/18 by admin. for demo
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

provider "aws" {
  access_key = "${var.aws_access_id}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
  version = "~> 1.8"
}

resource "aws_instance" "db" {
  ami = "${var.db_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.db_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${aws_subnet.subnet.id}"
  tags {
    Name = "${var.db_name}"
  }
}

resource "aws_instance" "web" {
  ami = "${var.web_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.web_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id  = "${aws_subnet.subnet.id}"
  tags {
    Name = "${var.web_name}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "aws-temp-public-key"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "aws_vpc" "default" {
  cidr_block           = "10.1.0.0/0"
  enable_dns_hostnames = true

  tags {
    Name = "${var.network_name_prefix}"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "Main"
  }
}

