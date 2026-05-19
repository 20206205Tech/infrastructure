variable "demo_service_projects" {
  type        = list(string)
  description = "Danh sách project cho demo service"
  default = [
    "dev-demo-service",
    "prod-demo-service"
  ]
}

variable "supabase_jwks_url" {
  type        = string
  description = "JWKS URL cho Supabase Authentication Provider"
  default     = "https://cmtvbkvxwspkdstrcrfm.supabase.co/auth/v1/.well-known/jwks.json"
}