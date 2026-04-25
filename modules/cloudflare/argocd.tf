resource "cloudflare_record" "argocd_dns" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "argocd"
  type    = "A"
  content = "213.35.104.228" 
  proxied = true
}