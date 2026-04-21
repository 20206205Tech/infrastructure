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