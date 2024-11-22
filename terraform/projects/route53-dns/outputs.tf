output "route53_dns_domains" {
  description = "Route53 zone information for each domain"
  value = {
    for domain_name in module.domain_data.domains :
    domain_name => module.route53_dns_domain[domain_name]
  }
}
