#####################################################################
##
##      Created 9/4/18 by thnoi. for kbank
##
#####################################################################

variable "aws_instance_ami" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_aws_instance_type" {
  type = "string"
  description = "Generated"
}

variable "availability_zone" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_name" {
  type = "string"
  description = "Generated"
}

variable "aws_instance_connection_user" {
  type = "string"
  default = "root"
}

variable "aws_instance_connection_password" {
  type = "string"
}

variable "aws_instance_connection_host" {
  type = "string"
}

variable "network_name_prefix" {
  type = "string"
  description = "Generated"
}

