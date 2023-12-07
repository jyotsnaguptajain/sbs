resource "aws_autoscaling_group" "my_asg" {
  name              = "my_asg"
  max_size          = 2
  min_size          = 1
  health_check_type = "ELB" # optional
  desired_capacity  = 1
  target_group_arns = [var.target_group_arn]

  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.sbs_launch_template.id
    version = "$Latest"
  }
}