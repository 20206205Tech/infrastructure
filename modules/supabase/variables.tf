variable "SUPABASE_ACCESS_TOKEN" {
  type        = string
  description = "Personal Access Token của Supabase"
  sensitive   = true
}

variable "SUPABASE_ORGANIZATION_ID" {
  type        = string
  description = "ID của Organization trên Supabase"
  default     = "lzpbqmedjxywckgdnoqx" 
}

variable "project_names" {
  type        = map(string)
  description = "Danh sách tên các dự án Supabase cần tạo"
  default = {
    dev  = "project-DEV-by-terraform"
    prod = "project-PROD-by-terraform"
  }
}

variable "SUPABASE_DB_PASSWORD" {
  type        = string
  description = "Mật khẩu cho database"
  sensitive   = true
}

variable "GOOGLE_CLIENT_ID" {
  type        = string
  description = "Client ID cho Google OAuth"
  sensitive   = true
}

variable "GOOGLE_CLIENT_SECRET" {
  type        = string
  description = "Client Secret cho Google OAuth"
  sensitive   = true
}

variable "SMTP_HOST" {
  type        = string
  description = "Địa chỉ máy chủ SMTP"
  default     = "smtp.gmail.com"
}

variable "SMTP_PORT" {
  type        = string
  description = "Cổng SMTP"
  default     = "587"
}

variable "SMTP_USERNAME" {
  type        = string
  description = "Tên đăng nhập SMTP"
  sensitive   = true
}

variable "SMTP_PASSWORD" {
  type        = string
  description = "Mật khẩu SMTP"
  sensitive   = true
}

variable "SMTP_ADMIN_EMAIL" {
  type        = string
  description = "Địa chỉ email người gửi (From Email)"
  default     = "support@20206205.tech"
}

variable "SMTP_SENDER_NAME" {
  type        = string
  description = "Tên hiển thị của người gửi (From Name)"
  default     = "(20206205.tech) AI Chatbot - Support"
}