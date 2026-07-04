variable "project_name" {
}
variable "environment" {
}
variable "vpc_cidr" {
}
variable "common_tags" {

}
variable "networking_tags" {
}
variable "public_subnet_cidrs" {
}

variable "private_subnet_cidrs" {
}
variable "enable_dns_hostnames" {
  type    = bool
  default = true
}
variable "is_peering_required" {
}

variable "public_subnet_tags" {
}

variable "private_subnet_tags" {
}

variable "availability_zones" {
}

variable "igw_tags" {
}
variable "eip_tags" {
}
variable "nat_gateway_tags" {
}
variable "public_route_table_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}
variable "public_route_table_tags" {
}