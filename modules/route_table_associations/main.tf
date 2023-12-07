resource "aws_route_table_association" "a" {
  subnet_id      = var.subnet_id_a
  route_table_id = var.route_table_id
}

resource "aws_route_table_association" "b" {
  subnet_id      = var.subnet_id_b
  route_table_id = var.route_table_id
}

resource "aws_route_table_association" "c" {
  subnet_id      = var.subnet_id_c
  route_table_id = var.route_table_id
}