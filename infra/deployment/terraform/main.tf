provider "aws" {
  version = "~> 2.61.0"
  region  = "${local.aws_region}"
}

provider "template" {
  version = "~> 2.1"
}

terraform {
  required_version = ">= 0.12.5"
}

variable "docker_image_name" {
  type        = "string"
  description = "application docker image"
}

locals {
  application_name          = "disqus-poc"
  application_brand         = "mosaico"
  application_version       = "v1"
  environment               = "dev"
  aws_region                = "us-east-1"
  newrelic_application_name = "${local.application_name}-${local.application_version}/${local.environment}/${local.application_brand}/aws-ecs/us-east-1"
  vcpu                      = 1
  force_client_side_fetch   = "false"
  vpc_id                    = "vpc-03ed6767"
  stage                     = "dev"

  tags = {
    Project     = "squad-mar"
    Application = "${local.application_name}"
    Brand       = "${local.application_brand}"
    Environment = "${local.environment}"
    Billing     = "squad-mar"
    Provisioner = "terraform"
  }
}
