module "web-1" {
  source = "./module/ec2"

  name = local.name
  prefix = local.name
  suffix = "web"
  ami = element([data.aws_ami.amazonLinux.id], 0)
  azs = [data.aws_availability_zones.azs.names[0]]
  subnet_id = module.private_subnets_web_a.subnet_ids[0]
# subnet_id = join(",", module.public_subnets_a.subnet_ids)
  type = "t3.micro"
  abc = "private"
  volume = "30"
  voltype = "gp3"
}

module "bastion" {
  source = "./module/ec2"

  name = local.name
  prefix = local.name
  suffix = "bastion"
  ami = element([data.aws_ami.amazonLinux.id], 0)
  azs = [data.aws_availability_zones.azs.names[0]]
  subnet_id = module.public_subnets_a.subnet_ids[0]
  type = "t3.micro"
  abc = "public"
  volume = "8"
  voltype = "gp2"
}

module "web-2" {
  source = "./module/ec2"

  name = local.name
  prefix = local.name
  suffix = "web"
  ami = element([data.aws_ami.amazonLinux.id], 0)
  azs = [data.aws_availability_zones.azs.names[2]]
  subnet_id = module.private_subnets_web_c.subnet_ids[0]
# subnet_id = join(",", module.public_subnets_a.subnet_ids)
  type = "t3.micro"
  abc = "private"
  volume = "30"
  voltype = "gp3"
}

module "was-1" {
  source = "./module/ec2"

  name = local.name
  prefix = local.name
  suffix = "was"
  ami = element([data.aws_ami.amazonLinux.id], 0)
  azs = [data.aws_availability_zones.azs.names[0]]
  subnet_id = module.private_subnets_was_a.subnet_ids[0]
# subnet_id = join(",", module.public_subnets_a.subnet_ids)
  type = "t3.micro"
  abc = "private"
  volume = "30"
  voltype = "gp3"
}

module "was-2" {
  source = "./module/ec2"

  name = local.name
  prefix = local.name
  suffix = "was"
  ami = element([data.aws_ami.amazonLinux.id], 0)
  azs = [data.aws_availability_zones.azs.names[2]]
  subnet_id = module.private_subnets_was_c.subnet_ids[0]
# subnet_id = join(",", module.public_subnets_a.subnet_ids)
  type = "t3.micro"
  abc = "private"
  volume = "30"
  voltype = "gp3"
}


 