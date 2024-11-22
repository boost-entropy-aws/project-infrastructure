output "zone_name" {
  value = aws_route53_zone.zone.name
}

output "zone_id" {
  value = aws_route53_zone.zone.zone_id
}

output "zone_arn" {
  value = aws_route53_zone.zone.arn
}

output "zone_name_servers" {
  value = [for ns in aws_route53_zone.zone.name_servers : ns]
}
