
resource "aws_lb_listener" "my_lb_listener" {
  load_balancer_arn = aws_lb.sbs_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}