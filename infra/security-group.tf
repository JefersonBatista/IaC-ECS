resource "aws_security_group" "alb" {
  name   = "alb-ecs"
  vpc_id = module.vpc.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ingress_alb" {
  security_group_id = aws_security_group.alb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 8000
  to_port     = 8000
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "egress_alb" {
  security_group_id = aws_security_group.alb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  to_port     = 0
  ip_protocol = "-1"
}

resource "aws_security_group" "private" {
  name   = "private-ecs"
  vpc_id = module.vpc.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "private_ingress" {
  security_group_id = aws_security_group.private.id

  referenced_security_group_id = aws_security_group.alb.id
  from_port                    = 0
  to_port                      = 0
  ip_protocol                  = "-1"
}

resource "aws_vpc_security_group_egress_rule" "private_egress" {
  security_group_id = aws_security_group.private.id

  referenced_security_group_id = aws_security_group.alb.id
  from_port                    = 0
  to_port                      = 0
  ip_protocol                  = "-1"
}


