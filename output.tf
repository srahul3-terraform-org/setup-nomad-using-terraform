output "region" {
  value = var.region
}

output "consul_ui" {
  value = "http://${aws_instance.server[0].public_ip}:8500/ui"
}
output "consul_token_secret" {
  value = random_uuid.nomad_token.result
}

output "nomad_ui" {
  value = "http://${aws_route53_record.nomad.name}:4646/ui"
}
output "NOMAD_ADDR" {
  value = "http://${aws_route53_record.nomad.name}:4646"
}
output "NOMAD_TOKEN" {
  value = "${data.http.kv.response_body}"
}

output "server_public_ips" {
  value = "${join(", ", aws_instance.server[*].public_ip)}"
}
output "client_public_ips" {
  value = "${join(", ", aws_instance.client[*].public_ip)}"
}