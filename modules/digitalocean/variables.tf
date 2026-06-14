variable "DIGITALOCEAN_TOKEN" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Khu vực đặt server"
  type        = string
  default     = "sgp1" # Singapore
}

variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "droplet_image" {
  type    = string
  default = "ubuntu-24-04-x64"
}

variable "OCI_SSH_PUBLIC_KEY" {
  type        = string
  description = "Public Key để SSH vào Droplet (Dùng chung với OCI cho tiện)"
  sensitive   = true
}

# Thêm biến khai báo danh sách các database cần khởi tạo
variable "databases" {
  type        = list(string)
  description = "Danh sách tên các cơ sở dữ liệu cần tạo trong cụm Postgres"
  default     = [
    # "database_data_pipeline_vbpl",
    # "data_pipeline_vbplnew",
    # "data_pipeline_phapdien",
    # "api_gateway",
    # "api_gateway_http_log",
    # "chat_history",
    "nghia",
# "prod_code_payment_service",
# "prod_code_conversation_service",
# "prod_code_chatbot_service",
# "prod_code_document_service",
# "prod_code_persona_service",
  ]
}