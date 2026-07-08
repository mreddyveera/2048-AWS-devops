variable "project_name" {
  type    = string
  default = "2048-game"
}
variable "environment" {
  type    = string
  default = "development"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "common_tags" {
  type = map(string)
  default = {
    Project     = "2048-game"
    Environment = "dev"
    Terraform   = "true"
  }
}
variable "vpc_tags" {
  type = map(string)
  default = {
    Name = "2048-learning"
  }
}
variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "is_peering_required" {
  type    = bool
  default = true
}

variable "public_subnet_tags" {
  type = map(string)
  default = {
    Name = "2048-public subnet"
  }
}

variable "private_subnet_tags" {
  type = map(string)
  default = {
    Name = "2048-private subnet"
  }
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "igw_tags" {
  type = map(string)
  default = {
    Name = " 2048-Internet-Gateway"

  }
}

variable "eip_tags" {
  type = map(string)
  default = {
    Name = " 2048-elastic-ip"

  }
}

variable "nat_gate_way_tags" {
  type = map(string)
  default = {
    Name = "2048-nat-gateway"
  }
}

variable "public_route_table_tags" {
  type = map(string)
  default = {
    Name = "2048-public-route-table"
  }
}

variable "alb_security_group_tags" {
  type = map(string)
  default = {
    resource-type = "application load balancer"
  }
}
variable "ecs_security_group_tags" {
  type = map(string)
  default = {
    resource-type = "ecs"
  }
}
variable "repository_name" {
  type    = string
  default = "2048-game-ECR-Registry"
}

variable "deletion_window_in_days" {
  type    = number
  default = 7
}
variable "enable_key_rotation" {
  type    = bool
  default = true
}
variable "desired_count" {
  type    = number
  default = 3
}

variable "domain_name" {
  type    = string
  default = "manikanta.space"

}

variable "alert_email"{
  type=string
  default="reddyveeramanikanta54304@gmail.com"
}

