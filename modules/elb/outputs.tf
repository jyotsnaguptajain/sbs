output "target_group_arn" {
  value = aws_lb_target_group.my_tg.arn
}

output "alb_dns_name" {
  value = aws_lb.sbs_alb.dns_name
}