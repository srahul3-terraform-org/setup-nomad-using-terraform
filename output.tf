output "region" {
  value = var.region
}

output "lb_address_consul_nomad" {
  value = <<CONFIGURATION
  "http://${aws_instance.server[0].public_ip}" or "http://${aws_route53_record.nomad.name}"
  CONFIGURATION
}

output "consul_token_secret" {
  value = random_uuid.nomad_token.result
}

output "IP_Addresses" {
  value = <<CONFIGURATION

Client public IPs: ${join(", ", aws_instance.client[*].public_ip)}

Server public IPs: ${join(", ", aws_instance.server[*].public_ip)}

The Consul UI can be accessed at http://${aws_instance.server[0].public_ip}:8500/ui
with the token: ${random_uuid.nomad_token.result}
CONFIGURATION
}