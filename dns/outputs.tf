output "zone_id" {
  description = "Route53 Hosted Zone ID"
  value       = aws_route53_zone.private.zone_id
}

output "zone_name" {
  description = "Route53 Zone Name"
  value       = aws_route53_zone.private.name
}