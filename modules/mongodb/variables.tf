variable "project_names" {
  type        = list(string)
  description = "Danh sách tên các dự án MongoDB cần tạo"
  default     = ["project-DEV", "project-PROD"]
}

variable "MONGODB_ATLAS_ORG_ID" {
  type        = string
  description = "ID của Organization trên MongoDB Atlas"
  default     = "69e6f449cfb60b32594ba7fb"
}

variable "MONGODB_ATLAS_PUBLIC_KEY" {
  type        = string
  description = "Public Key để xác thực API MongoDB"
  sensitive   = true
}

variable "MONGODB_ATLAS_PRIVATE_KEY" {
  type        = string
  description = "Private Key để xác thực API MongoDB"
  sensitive   = true
}

variable "MONGODB_DB_PASSWORD" {
  type        = string
  description = "Mật khẩu cho database user"
  sensitive   = true
}