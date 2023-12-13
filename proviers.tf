provider "aws" {
  region = local.region
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}
