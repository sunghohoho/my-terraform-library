

module "ec2-cpu" {
  source = "./module/cloudwatch-tag/ec2"

  evaluation = "5"
  threshold = [70,80,90]
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  stat = "Average"
  # unit = "Percent"
  level = ["1","1","2"]
  comparison = "GreaterThanOrEqualToThreshold"
}


# module "rds-cpu" {
#   source = "./module/cloudwatch-tag/rds"

#   comparison = "GreaterThanThreshold"
#   metric_name = "CPUUtilization"
#   period              = "120"
#   stat           = "Average"
#   threshold           = [70,80,90]
#   # unit = "Percent"
#   evaluation = "5"
#   level = ["1","1","2"]
#   identifier = ["database-1","database-2-instance-1"]
# }

module "ALB-healtyh" {
  source = "./module/cloudwatch-tag/elb"

  comparison = "GreaterThanThreshold"
  metric = "HealthyHostCount"
  period = "120"
  statistic = "Sum"
  threshold = "0"
  evaluation = "5"
  target = "arn:aws:elasticloadbalancing:ap-southeast-2:866477832211:loadbalancer/app/happy-ex-alb/a9f9134cd84fb4c1"
}