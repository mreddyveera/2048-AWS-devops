# =========================
# ALB SECURITY GROUP
# =========================
resource "aws_security_group" "public_alb_sg" {
  name        = "public-alb-sg"
  description = "Allow inbound HTTP/HTTPS traffic to ALB"
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    var.alb_security_group_tags,
    {
      Name = "public-alb-sg"
    }
  )
}

# ALB Inbound HTTP
resource "aws_vpc_security_group_ingress_rule" "alb_http_ingress" {
  security_group_id = aws_security_group.public_alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# ALB Inbound HTTPS
resource "aws_vpc_security_group_ingress_rule" "alb_https_ingress" {
  security_group_id = aws_security_group.public_alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# ALB Outbound to ECS on Port 80
resource "aws_vpc_security_group_egress_rule" "alb_to_ecs_egress" {
  security_group_id            = aws_security_group.public_alb_sg.id
  referenced_security_group_id = aws_security_group.ecs_sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

# =========================
# ECS SECURITY GROUP
# =========================
resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "Allow traffic from ALB to ECS"
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    var.ecs_security_group_tags,
    {
      Name = "ecs-sg"
    }
  )
}

# ECS Inbound from ALB on Port 80
resource "aws_vpc_security_group_ingress_rule" "ecs_from_alb_ingress" {
  security_group_id            = aws_security_group.ecs_sg.id
  referenced_security_group_id = aws_security_group.public_alb_sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

# ECS Outbound All Traffic
resource "aws_vpc_security_group_egress_rule" "ecs_all_outbound" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}