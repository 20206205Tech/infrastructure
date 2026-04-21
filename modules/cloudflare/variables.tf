variable "CLOUDFLARE_API_TOKEN" {
  type      = string
  sensitive = true
  description = "Token này nên được lấy từ Doppler (TF_VAR_CLOUDFLARE_API_TOKEN)"
}

variable "CLOUDFLARE_ACCOUNT_ID" {
  type      = string
  sensitive = true
  default   = "06b3eb95cf5b508ca0144ea456b524d6"
}

variable "domain_name" {
  type    = string
  default = "20206205.tech"
}