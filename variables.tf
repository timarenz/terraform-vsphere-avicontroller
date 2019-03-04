variable "avicontroller_name" {
  type        = "string"
  description = "Name of the Avi controller virtual machine"
}

variable "avicontroller_ip_address" {}

variable "avicontroller_netmask" {}

variable "avicontroller_gateway" {}

variable "avicontroller_public_key" {
  type        = "string"
  description = "Public key for Avi Controller authentication"
  default     = ""
}

variable "vm_vcpu" {
  type        = "string"
  description = "Number of vCPUs the Avi Controller virtual machine should use"
  default     = "8"
}

variable "vm_memory" {
  type        = "string"
  description = "Amount of memory in GB the Avi Controller virtual machine should use"
  default     = "24"
}

variable "vm_disk" {
  type        = "string"
  description = "Size of the Avi Controller disk in GB"
  default     = "64"
}

variable "vsphere_datacenter" {}

variable "vsphere_cluster" {}

variable "vsphere_resource_pool" {
  default = "Resources"
}

variable "vsphere_vm_datastore" {
  type        = "string"
  description = "vSphere datastore the Avi Controller should be placed on"
}

variable "vsphere_vm_network" {
  type        = "string"
  description = "vSphere port group the Avi Controller should be connected to"
}

variable "vsphere_vm_template" {}
