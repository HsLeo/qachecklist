terraform {
  required_version = ">= 0.12, < 0.13"
}

variable "cloud_credential_api_id" {
  type        = string
  description = "The access_key"
  default     = "LTAIeMmM65pbyWMg"
}

variable "cloud_credential_secret" {
  type        = string
  description = "The secret_key"
  default     = "iaeuINgnYiwvPz4CNrfXaAp7Ik2Hiz"
}

variable "region" {
  type        = string
  description = "The region"
  default     = "cn-hongkong"
}

variable "image_id" {
  type        = string 
  description = "The instance image id"
  default     = "centos_6_09_64_20G_alibase_20180326.vhd" 
}

variable "instance_type" {
  type        = string 
  description = "The instance_type used"
  default     = "ecs.t5-lc2m1.nano" 
}

variable "security_groups" {
  type        = list 
  description = "The security_groups"
  default     = ["sg-j6c53edilms18gnr14aj"] 
}

variable "vswitch_id" {
  type        = string
  description = "The virtual private cloud switch"
  default     = "vsw-j6cm0g7z02y5wkea2qbxf"
}

provider "alicloud" {
  region  = "cn-hongkong"
  access_key = "LTAIeMmM65pbyWMg"
  secret_key = "iaeuINgnYiwvPz4CNrfXaAp7Ik2Hiz"
  version = "~> 1.50"
}

resource "alicloud_instance" "ins" {
  image_id             = "centos_6_09_64_20G_alibase_20180326.vhd"
  # internet_charge_type = "PayByTraffic"
  instance_type        = "ecs.t5-lc2m1.nano"
  security_groups      = ["sg-j6c53edilms18gnr14aj"]
  vswitch_id           = "vsw-j6cm0g7z02y5wkea2qbxf"
}

output "instance_info" {
  value       = ["${alicloud_instance.ins.*}"]
  description = "The instance info created"
}
