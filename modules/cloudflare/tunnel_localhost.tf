resource "random_password" "localhost_tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "localhost_tunnel" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "localhost-tunnel"
  secret     = base64encode(random_password.localhost_tunnel_secret.result)
  config_src = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "localhost_tunnel_config" {
  account_id = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id

  config {
    ingress_rule {
      hostname = "dev-data-pipeline-service.${var.domain_name}"
      service  = "http://localhost:30000"
    }
    ingress_rule {
      hostname = "dev-code-payment-service.${var.domain_name}"
      service  = "http://localhost:30001"
    }
    ingress_rule {
      hostname = "dev-code-conversation-service.${var.domain_name}"
      service  = "http://localhost:30002"
    }
    ingress_rule {
      hostname = "dev-code-chatbot-service.${var.domain_name}"
      service  = "http://localhost:30003"
    }
    ingress_rule {
      hostname = "dev-code-document-service.${var.domain_name}"
      service  = "http://localhost:30004"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

# DNS Records cho Tunnel
resource "cloudflare_record" "tunnel_dns" {
  for_each = toset([
    "dev-data-pipeline-service",
    "dev-code-payment-service",
    "dev-code-conversation-service",
    "dev-code-chatbot-service",
    "dev-code-document-service"
  ])

  zone_id = data.cloudflare_zone.domain.id
  name    = each.key
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.localhost_tunnel.id}.cfargotunnel.com"
  proxied = true
}