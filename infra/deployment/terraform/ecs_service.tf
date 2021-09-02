data "aws_subnet_ids" "subnets" {
  vpc_id = local.vpc_id
  tags = {
    Tier = "private" // podendo ser "private" ou "public"
  }
}

module "ecs_service_website" {
  source = "git::http://gitlab.mosaico.com.br/oss/terraform/ecs-service?ref=v5.1.0-rc1"

  cluster = "squad-mar-dev"

  application = {
    name        = "${local.application_name}-${local.application_brand}"
    version     = "${local.application_version}"
    environment = "${local.environment}"
  }

  container = {
    image  = "${var.docker_image_name}"
    cpu    = 512
    memory = 512
    port   = 3000
    health_check_grace_period_seconds = 0
  }

  scale = {
    cpu = 60
    min = 1
    max = 1
  }

  environment = [
    { "name" : "DISABLE_SHORTCUT_MIDDLEWARE", "value" : "true" },
    { "name" : "BRAND", "value" : "${local.application_brand}" },
    { "name" : "NEW_RELIC_APP_NAME", "value" : "${local.newrelic_application_name}" },
    { "name" : "VCPU", "value" : "${local.vcpu}" },
    { "name" : "FORCE_CLIENT_SIDE_FETCH", "value" : "${local.force_client_side_fetch}" },
    { "name" : "STAGE", "value" : "${local.stage}" }
  ]

  network = {
    vpc             = local.vpc_id
    subnets         = data.aws_subnet_ids.subnets.ids
    security_groups = [aws_security_group.application_ecs_service.id]
  }

  service_policy = "policies/service_policy.json"

  tags = local.tags

  capacity_provider = "squad-mar-dev-spot-ECSCapacityProvider"

  alb = {
    enable             = true
    public             = false
    certificate_domain = ""
    idle_timeout       = 60
    subnets            = data.aws_subnet_ids.subnets.ids
    security_groups    = [aws_security_group.application_load_balancer.id]
    enable_deletion_protection = true
    redirect_to_https = true
  }

  tg = {
    health_check_path = "/"
    health_check_unhealthy_threshold = 3
    health_check_healthy_threshold = 3
    health_check_timeout = 30
    interval = 35
    deregistration_delay = 300
  }
}
