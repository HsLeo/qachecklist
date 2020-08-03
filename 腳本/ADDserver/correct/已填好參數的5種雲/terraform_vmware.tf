terraform {
  required_version = ">= 0.12"
}

################################
#  Modify the variables below  #
################################

variable "server" {
  type        = string
  description = "The hostname of vCenter server"
  default     = "192.168.89.200"
}

variable "user" {
  type        = string
  description = "The user name to login vCenter server"
  default     = "administrator@pentium.network"
}

variable "password" {
  type        = string
  description = "The password to login vCenter server"
  default     = "PMexsipentium!@#$16"
}

variable "allow_unverified_ssl" {
  type        = bool
  description = "If you have a self-signed cert, Boolean that can be set to true to disable SSL certificate verification."
  default     = true
}

variable "datacenter" {
  type        = string
  description = "the vsphere data center name"
  default     = "Pentium VMware"
}

variable "datastore" {
  type        = string
  description = "the vsphere datastore of the resource pool"
  default     = "datastore2"
}

variable "resource_pool" {
  type        = string
  description = "The resource pool to place the instance. For root resource pool, please specify with {esxi_name}/Resources"
  default     = "test"
}

variable "network" {
  type        = string
  description = "The vsphere network for the instance"
  default     = "VM Network2"
}

variable "template" {
  type        = string
  description = "The vsphere template name"
  default     = "centos7-template"
}

variable "name" {
  type        = string
  description = "The vsphere instance name"
  default     = "dan-test"
}

variable "num_cpus" {
  type        = number
  description = "The cpu numbers. Terraform haven't support the cpu numbers from template, please manually modify the CPU and momery here."
  default     = 1
}

variable "memory" {
  type        = number
  description = "The instance memory. Terraform haven't support the memory size from template, please manually modify the CPU and momery here."
  default     = 1024
}

variable "disk_size" {
  type        = number
  description = "The instance disk size, set to zero will use the disk size from template"
  default     = 0
}

variable "wait_for_guest_net_timeout" {
  type        = number
  description = "The timeout setting to wait for network connect"
  default     = 5
}

################################
#  Modify the variables above  #
################################

provider "vsphere" {
  user           = var.user
  password       = var.password
  vsphere_server = var.server
  allow_unverified_ssl = var.allow_unverified_ssl
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.num_cpus
  memory   = var.memory
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types.0
  }

  disk {
    label = "disk0"
    size  = var.disk_size != 0 ? var.disk_size : data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  wait_for_guest_net_timeout = var.wait_for_guest_net_timeout
}
