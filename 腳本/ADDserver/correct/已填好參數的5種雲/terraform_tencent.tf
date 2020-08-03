terraform {
  required_version = ">= 0.12, < 0.13"
}

# necessary
variable "cloud_credential_api_id" {
  type        = string
  description = "The secret_id to create vm"
  default     = ""
}

# necessary
variable "cloud_credential_secret" {
  type        = string
  description = "The secret_key to create vm"
  default     = ""
}

# necessary
variable "region" {
  type        = string
  description = "The region"
  default     = ""
}

# necessary
variable "availability_zone" {
  type        = string
  description = "The availability zone"
  default     = ""
}

# optional
variable "amount" {
  type        = number 
  description = "The instance count to establish"
  default     = "1"
}

# necessary
variable "image_id" {
  type        = string 
  description = "The instance image id"
  default     = "" 
}

# necessary
variable "instance_type" {
  type        = string
  description = "The instance type"
  default     = ""
}

# necessary
variable "system_disk_type" {
  type        = string
  description = "The disk type"
  default     = ""
}

# necessary
variable "system_disk_size" {
  type        = number
  description = "The default disk size in GB"
  default     = 50
}

# optional
variable "security_groups" {
  type        = list
  description = "The security groups"
  default     = []
}

provider "tencentcloud" {
  region = "ap-hongkong"
  secret_id = "AKIDeBXiiXpctysa7SdDe0LajlhXGtPrBQYZ"
  secret_key = "54xvpdMzfMyVxKcjomZGoBNOH1b0EICv"
  # Allow any 1.X version of tencentcloud provider
  version = "~> 1.9"
}

resource "tencentcloud_instance" "ins" {
  image_id           = "img-9qabwvbn"
  instance_type      = "S2.SMALL1"
  count              = var.amount
  availability_zone  = "ap-hongkong-2"
  system_disk_type   = "CLOUD_PREMIUM"
  system_disk_size   = var.system_disk_size
  security_groups    = var.security_groups   
}

output "instance_info" {
  value       = ["${tencentcloud_instance.ins.*}"]
  description = "The instance info created"
}
