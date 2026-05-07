variable "NEON_API_KEY" {
  type        = string
  description = "API Key để xác thực với Neon"
  sensitive   = true
}

variable "NEON_ORGANIZATION_ID" {
  type        = string
  description = "ID của Organization trên Neon"
  default     = "org-still-feather-82034197"
}

variable "setting_service_projects" {
  type        = list(string)
  description = "Danh sách project cho setting service"
  default = [
    "dev-setting-service",
    "prod-setting-service"
  ]
}

variable "projects" {
  type        = list(string)
  description = "Danh sách tên các project Neon cần tạo"
  default = [
    "dev-database-data-pipeline-vbpl",
    "prod-database-data-pipeline-vbpl",

    "dev-data-pipeline-vbplnew",
    "prod-data-pipeline-vbplnew",

    "dev-data-pipeline-phapdien",
    "prod-data-pipeline-phapdien",

    "dev-api-gateway",
    "prod-api-gateway",
    "dev-api-gateway-http-log",
    "prod-api-gateway-http-log",

    "dev-payment-service",
    "prod-payment-service",

    "dev-conversation-service",
    "prod-conversation-service",

    "dev-chatbot-service",
    "prod-chatbot-service",
    "dev-chat-history",
    "prod-chat-history",

    # "dev-document-service",
    # "prod-document-service",
    # "dev-vector-database-user-documents",
    # "prod-vector-database-user-documents",

    # "dev-persona-service",
    # "prod-persona-service",
  ]
}

