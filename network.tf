module "vpc" {
  source = "./module/vpc"

  name = local.name
  cidr = "10.0.0.0/16"
}

module "public_subnets_a" {
     source = "./module/subnet"

     prefix = local.name
     suffix = "public"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[0]]
     cidr   = ["10.0.0.0/24"]
     type   = "public"
     gateway_id = module.vpc.igw_id
 }


 module "public_subnets_c" {
     source = "./module/subnet"

     prefix = local.name
     suffix = "public"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[2]]
     cidr   = ["10.0.20.0/24"]
     type   = "public"
     gateway_id = module.vpc.igw_id
 }

 module "private_subnets_web_a" {
     source = "./module/subnet"

    prefix = local.name
     suffix = "private-web"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[0]]
     cidr   = ["10.0.30.0/24"]
     type   = "private"
     nat_gateway_id = module.nat-a.ids[0]
 }


 module "private_subnets_web_c" {
     source = "./module/subnet"

    prefix = local.name
     suffix = "private-web-c"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[2]]
     cidr   = ["10.0.50.0/24"]
     type   = "private"
     nat_gateway_id = module.nat-c.ids[0]
 }

 module "private_subnets_was_a" {
     source = "./module/subnet"

    prefix = local.name
     suffix = "private-was"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[0]]
     cidr   = ["10.0.60.0/24"]
     type   = "private"
   nat_gateway_id = module.nat-a.ids[0]
 }


 module "private_subnets_was_c" {
     source = "./module/subnet"

    prefix = local.name
     suffix = "private-was"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[2]]
     cidr   = ["10.0.80.0/24"]
     type   = "private"
    nat_gateway_id = module.nat-c.ids[0]
 }

  module "private_subnets_db_a" {
     source = "./module/subnet"

    prefix = local.name
     suffix = "private-db"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[0]]
     cidr   = ["10.0.90.0/24"]
     type   = "private"
    nat_gateway_id = module.nat-a.ids[0]
 }

  module "private_subnets_db_c" {
     source = "./module/subnet"

    prefix = local.name
     suffix = "private-db"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[2]]
     cidr   = ["10.0.100.0/24"]
     type   = "private"
    nat_gateway_id = module.nat-c.ids[0]
 }

  module "private_subnets_redis_a" {
     source = "./module/subnet"

    prefix = local.name
     suffix = "private-redis"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[0]]
     cidr   = ["10.0.120.0/24"]
     type   = "private"
   nat_gateway_id = module.nat-a.ids[0]
 }

 module "private_subnets_redis_c" {
     source = "./module/subnet"

    prefix = local.name
     suffix = "private-redis"
     vpc_id = module.vpc.vpc_id
     azs    = [data.aws_availability_zones.azs.names[2]]
     cidr   = ["10.0.140.0/24"]
     type   = "private"
   nat_gateway_id = module.nat-c.ids[0]
 }

 module "nat-a" {
   source = "./module/nat"
   prefix = local.name

   name = "${local.name}-nat-a"
   subnet_id = module.public_subnets_a.subnet_ids[0]
    azs    = [data.aws_availability_zones.azs.names[0]]
 }

 module "nat-c" {
   source = "./module/nat"
   prefix = local.name

   name = "${local.name}-nat-c"
   subnet_id = module.public_subnets_c.subnet_ids[0]
    azs    = [data.aws_availability_zones.azs.names[2]]
 }

 