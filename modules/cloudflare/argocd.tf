resource "cloudflare_record" "argocd_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "argocd"
  type    = "A"
  content = "134.185.92.211" 
  proxied = true
}