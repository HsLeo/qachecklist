terraform {
  required_version = ">= 0.12, < 0.13"
}

variable "cloud_credential_api_id" {
  type        = string
  description = "The aws access_key"
  default     = ""
}

variable "cloud_credential_secret" {
  type        = string
  description = "The aws secret_key"
  default     = ""
}

variable "region" {
  type        = string
  description = "The aws region"
  default     = ""
}

variable "amount" {
  type        = number 
  description = "The instance count to establish"
  default     = "1"
}

variable "image_id" {
  type        = string 
  description = "The instance ami"
  default     = "" 
}

variable "instance_type" {
  type        = string
  description = "The instance type"
  default     = ""
}

provider "aws" {
  region  = "ap-northeast-1"
  access_key = "AKIAIVKD5NDH6HGVQNJQ"
  secret_key = "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"
  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

# create security group if need
#resource "aws_security_group" "sg" {
#  name        = "sg"
#  description = "Your description here"
#
#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["xxx.xxx.xxx.xxx/32"]
#  }
#
#  egress {
#    from_port       = 0
#    to_port         = 0
#    protocol        = "-1"
#    cidr_blocks     = ["0.0.0.0/0"]
#  }
#}

resource "aws_instance" "ins" {
  ami           = "ami-045f38c93733dd48d"
  instance_type = "t2.micro"
  count         = var.amount
  tags = {
    Name = "qa-test-terraform"
  }
  #vpc_security_group_ids = []
  #subnet_id              = ""
  #key_name               = ""
  #root_block_device {
  #  delete_on_termination = true
  #}
}

output "instance_info" {
  value       = ["${aws_instance.ins.*}"]
  description = "The instance info created"
}
