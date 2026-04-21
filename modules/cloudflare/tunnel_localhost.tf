# 1. Khai báo danh sách các service local và port tương ứng
locals {
  localhost_services = {
    "dev-data-pipeline-service"     = "http://localhost:30000"
    "dev-code-payment-service"      = "http://localhost:30001"
    "dev-code-conversation-service" = "http://localhost:30002"
    "dev-code-chatbot-service"      = "http://localhost:30003"
    "dev-code-document-service"     = "http://localhost:30004"
  }
}

# 2. Tạo secret cho Tunnel
resource "random_password" "localhost_tunnel_secret" {
  length = 64
}

# 3. Định nghĩa Tunnel
resource "cloudflare_zero_trust_tunnel_cloudflared" "localhost_tunnel" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "localhost-tunnel"
  secret     = base64encode(random_password.localhost_tunnel_secret.result)
  config_src = "cloudflare"
}

# 4. Cấu hình Tunnel Ingress Rules (Sử dụng Dynamic Block)
resource "cloudflare_zero_trust_tunnel_cloudflared_config" "localhost_tunnel_config" {
  account_id = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id

  config {
    # Tự động tạo rule cho từng service trong map locals
    dynamic "ingress_rule" {
      for_each = local.localhost_services
      content {
        hostname = "${ingress_rule.key}.${var.domain_name}"
        service  = ingress_rule.value
      }
    }

    # Quy tắc mặc định cuối cùng (Bắt buộc phải có)
    ingress_rule {
      service = "http_status:404"
    }
  }
}

# 5. Tự động tạo DNS Records (CNAME) cho toàn bộ services
resource "cloudflare_record" "tunnel_dns" {
  for_each = local.localhost_services

  zone_id = data.cloudflare_zone.domain.id
  name    = each.key
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
}