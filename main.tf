provider "aws" {
  alias = "dnsProvider"
}

resource "aws_route53_record" "a" {
  allow_overwrite = true
  name            = var.name
  provider        = aws.dnsProvider
  type            = "A"
  zone_id         = var.domain_zone_id

  alias {
    evaluate_target_health = false
    name                   = var.alias_name
    zone_id                = var.alias_hosted_zone_id
  }
}

resource "aws_route53_record" "aaaa" {
  allow_overwrite = true
  name            = var.name
  provider        = aws.dnsProvider
  type            = "AAAA"
  zone_id         = var.domain_zone_id

  alias {
    evaluate_target_health = false
    name                   = var.alias_name
    zone_id                = var.alias_hosted_zone_id
  }
}
