resource "aws_launch_template" "sbs_launch_template" {

  name = "sbs_launch_template"

  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.iam_profile_name
  }

  user_data = filebase64("${path.module}/server.sh")

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]
  }
}