output "colab_tunnel_command" {
  value       = "cloudflared tunnel run --token ${cloudflare_zero_trust_tunnel_cloudflared.colab_tunnel.tunnel_token}"
  description = "Lệnh chạy tunnel trên Google Colab"
  sensitive   = true
}

# output "colab_urls" {
#   value = [
#     "https://colab.${var.domain_name}",
#     "https://webhook.${var.domain_name}"
#   ]
#   description = "Các URL truy cập dịch vụ trên Colab"
# }


output "localhost_tunnel_token" {
  value       = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.tunnel_token
  description = "Token để cấu hình cloudflared tại máy local"
  sensitive   = true
}

# output "localhost_service_urls" {
#   value = {
#     for name, service in local.localhost_services : name => "https://${name}.${var.domain_name}"
#   }
#   description = "Danh sách URL tương ứng với từng service local"
# }
