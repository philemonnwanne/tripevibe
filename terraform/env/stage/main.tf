module "alb" {
  source = "../../modules/alb"

  vpc_id = module.vpc.vpc_id
  # domain = module.route53.route53_zone_name
  subnets         = module.vpc.vpc_public_subnet_id
  security_groups = module.security.alb_security_group_id[*]
  # backend_target = module.ecs.backend_task_id
}

module "cloudfront" {
  source = "../../modules/cloudfront"

  resources = ["${module.s3.tripvibe_cloudfront_s3_arn}/*"]
  s3_domain_name = module.s3.tripvibe_cloudfront_s3_domain_name
}

module "ecs" {
  source = "../../modules/ecs"

  security_groups = module.security.backend_security_group_id[*]
  # subnet_ids = module.vpc.vpc_private_subnet_id
  subnet_ids = module.vpc.vpc_public_subnet_id
  # tags = local.tags
  vpc_id = module.vpc.vpc_id
  # target_group_arn = "${module.alb.target_group_arns[0]}"
  target_group_arn = module.alb.target_group_arn
}

# module "grafana-cloud" {
#   source = "../../modules/grafana-cloud"
# }

# terraform {
#   backend "s3" {
#     # Replace this with your bucket name!
#     bucket = "tripvibe-state-dev"
#     region       = "us-east-1"
#     key    = "dev/terraform.tfstate"
#     encrypt   = true
#   }
# }

module "route53" {
  source = "../../modules/route53"
  cloudfront_alias_name = module.cloudfront.tripvibe_cloudfront_domain_name
  cloudfront_alias_zone_id = module.cloudfront.tripvibe_cloudfront_hosted_zone_id
  alb_alias_name = module.alb.alb_dns
  alb_alias_zone_id = module.alb.alb_zone_id
}

module "security" {
  source = "../../modules/security"

  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "../../modules/vpc"
}

# module "state" {
#   source = "../../global/statefile"
# }

module "s3" {
  source = "../../modules/s3"
  policy = module.cloudfront.tripvibe_s3_policy
}