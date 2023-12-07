resource "aws_lb" "sbs_alb" {
  name               = "sbs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids[*]
}