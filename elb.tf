
module "ex-alb" {
  source = "./module/elb"

  prefix = local.name
  suffix = "ex-alb"
  internal = false
  type = "application"
  subnets = [module.public_subnets_a.subnet_ids[0],
            module.public_subnets_c.subnet_ids[0]]

  port = 80
  vpc = module.vpc.vpc_id
  target_instance = module.bastion.ec2_id[0]
}

module "in-alb" {
  source = "./module/elb"

  prefix = local.name
  suffix = "in-alb"
  internal = true
  type = "application"
  subnets = [module.private_subnets_web_a.subnet_ids[0],
            module.private_subnets_web_c.subnet_ids[0]]
    port = 8080
    vpc = module.vpc.vpc_id
    target_instance = module.web-1.ec2_id[0]
}

# was alb의 경우에는 여러가지 포트를 사용할 수 있습니다. 이에 맞게 각 자 추가 할 수 있는 로직을 추가해보아요