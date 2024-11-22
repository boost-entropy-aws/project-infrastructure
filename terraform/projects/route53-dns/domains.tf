module "route53_dns_domain" {
  for_each = toset(module.domain_data.domains)
  source   = "./modules/per-domain"

  plan        = var.plan
  region      = var.region
  phase       = "per-domain"
  domain_name = each.value
}
