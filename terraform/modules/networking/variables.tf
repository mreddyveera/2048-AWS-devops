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
