module "my_vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
  vpc_name   = var.vpc_name
}

#Three subnets will be created
module "my_subnets" {
  source = "./modules/subnet"
  vpc_id = module.my_vpc.vpc_id
}

module "my_ig" {
  source = "./modules/ig"
  vpc_id = module.my_vpc.vpc_id
}
module "my_route_table" {
  source = "./modules/route_table"
  vpc_id = module.my_vpc.vpc_id
  ig_id  = module.my_ig.ig_id
}
module "my_route_table_associations" {
  source         = "./modules/route_table_associations"
  route_table_id = module.my_route_table.route_table_id
  subnet_id_a    = module.my_subnets.subnet_id_a
  subnet_id_b    = module.my_subnets.subnet_id_b
  subnet_id_c    = module.my_subnets.subnet_id_c
}
module "my_security_group" {
  source = "./modules/security_group"
  vpc_id = module.my_vpc.vpc_id
}
module "my_alb" {
  source            = "./modules/elb"
  security_group_id = module.my_security_group.security_group_id
  subnet_ids        = [module.my_subnets.subnet_id_a, module.my_subnets.subnet_id_b, module.my_subnets.subnet_id_c]
  vpc_id            = module.my_vpc.vpc_id
}
module "my_iam" {
  source = "./modules/iam"
}
module "my_asg" {
  source            = "./modules/asg"
  security_group_id = module.my_security_group.security_group_id
  subnet_ids        = [module.my_subnets.subnet_id_a, module.my_subnets.subnet_id_b, module.my_subnets.subnet_id_c]
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  target_group_arn  = module.my_alb.target_group_arn
  iam_profile_name  = module.my_iam.iam_profile_name.name

  depends_on = [module.my_iam]
}
