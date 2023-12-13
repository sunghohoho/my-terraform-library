# resource "aws_db_subnet_group" "this" {
#     name = "${local.name}-db-subnet-group"
#     subnet_ids = [module.private_subnets_db_a.subnet_ids[0], module.private_subnets_db_c.subnet_ids[0]]
#     description = "${local.name}-db-subnet-group"
# }

# module "rds" {
#     source = "./module/rds"

#     prefix = local.name
#     suffix = "rds"
#     identity = local.name
#     azs = [data.aws_availability_zones.azs.names[0]]
#     class = "db.t3.micro"
#     engine = "mysql"
#     engine_ver = "8.0.23"
#     storage = "20"
#     storage_type = "gp3"
#     multiaz = false
#     minor = false
#     backuptime = "16:50-17:20"
#     maintenancetime = "sun:17:50-sun:18:20"

#     username = local.name
#     password = "salt!234"
#     subnet_group = aws_db_subnet_group.this.name
   
# }