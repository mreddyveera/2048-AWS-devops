variable "project_name"{
    type= string
    default="2048_ogame_vpc"
}
variable "environment"{
    type= string
    default= "development"
}
variable "vpc_cidr"{
    type= string
    default= "10.0.0.0/16"
}
variable "common_tags"{
    type= map(string)
    default = {
        Project = "2048-game"
        Environment = "dev"
        Terraform = "true"
    }
}
variable "networking_tags"{
    type= map(string)
    default={
        Purpose = "learning"
    }
}
variable "public_subnet_cidrs"{
    type= list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs"{
    type= list(string)
    default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "is_peering_required"{
    type=bool
    default=true
}