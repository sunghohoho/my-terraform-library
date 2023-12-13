locals {
    region = "ap-southeast-2"
    name = "happy"
}


# AWS Provider에 설정된 리전에 있는 가용영역 정보 불러오기
data "aws_availability_zones" "azs" {}


data "aws_ami" "amazonLinux" {
  most_recent = true
  owners = [ "amazon" ]

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-2.0.*" ]
  }

  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }

  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}
