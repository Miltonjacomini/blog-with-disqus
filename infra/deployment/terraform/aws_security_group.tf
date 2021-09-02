resource "aws_security_group" "application_load_balancer" {
  name_prefix = "${local.application_name}-${local.application_brand}-alb"
  description = "Service ${local.application_name}-${local.application_brand} VPC Security Group"
  vpc_id      = local.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = "${local.tags}"
}

resource "aws_security_group" "application_ecs_service" {
  name_prefix = "${local.application_name}-${local.application_brand}-ecs-service"
  description = "Service ${local.application_name}-${local.application_brand} VPC Security Group"
  vpc_id      = local.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = "${local.tags}"
}
