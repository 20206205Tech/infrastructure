# 1. Khai báo bản ghi DNS (A Record) trỏ về IP của VPS
resource "cloudflare_record" "argocd_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "argocd"
  type    = "A"
  content = "213.35.104.228" 
  proxied = true
}

# 2. Tạo Origin Rule để bẻ hướng cổng giao tiếp sang 31743
resource "cloudflare_ruleset" "argocd_origin_port" {
  zone_id     = data.cloudflare_zone.domain.id
  name        = "ArgoCD Port Rewrite"
  description = "Chuyển hướng cổng cho ArgoCD"
  kind        = "zone"
  phase       = "http_request_origin"

  rules {
    action = "rewrite"
    action_parameters {
      origin {
        port = 31743
      }
    }
    # Chỉ áp dụng rule này khi truy cập đúng hostname của ArgoCD
    expression  = "(http.host eq \"argocd.${var.domain_name}\")"
    description = "Bẻ hướng cổng HTTPS cho ArgoCD"
    enabled     = true
  }
}