variable "HEROKU_API_KEY" {
  type        = string
  sensitive   = true
  description = "API Key lấy từ Heroku Account Settings"
}

variable "app_name" {
  type    = string
  default = "code-payment-service"
}

variable "app_region" {
  type    = string
  default = "us" # Heroku Free/Hobby thường dùng us hoặc eu
}

variable "app_stack" {
  type    = string
  default = "container" # Phù hợp với cách bạn deploy Docker
}

variable "domain_name" {
  type    = string
  default = "code-payment-service.20206205.tech"
}

variable "github_org_repo" {
  type    = string
  default = "20206205Tech/code-payment-service"
}

variable "github_branch" {
  type    = string
  default = "main"
}
