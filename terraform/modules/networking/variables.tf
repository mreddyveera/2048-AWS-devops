variable "project_name"{
}
variable "environment"{
}
variable "vpc_cidr"{
}
variable "common_tags"{

}
variable "networking_tags"{
}
variable "public_subnet_cidrs"{
}

variable "private_subnet_cidrs"{
}
variable "enable_dns_hostnames"{
    type=bool
    default=true
}
variable "is_peering_required"{
}

variable "public_subnet_tags"{
}

variable "private_subnet_tags"{
}

variable "availabilty_zones"{
}

variable "igw_tags"{
}
variable "eip_tags"{
}
variable "nat_gateway_tags"{
}