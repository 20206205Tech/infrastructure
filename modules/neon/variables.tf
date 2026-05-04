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

variable "projects" {
  type        = list(string)
  description = "Danh sách tên các project Neon cần tạo"
  default = [
    "dev-database-api-gateway",
    "prod-database-api-gateway",

    "dev-database-api-gateway-http-log",
    "prod-database-api-gateway-http-log",

    "dev-database-persona-service",
    "prod-database-persona-service",

    # "dev-database-subscription-service",
    # "prod-database-subscription-service",

    "dev-database-document-service",
    "prod-database-document-service",

    "dev-database-chatbot-service",
    "prod-database-chatbot-service",

    "dev-database-chat-history",
    "prod-database-chat-history",

    "dev-database-conversation-service",
    "prod-database-conversation-service",

    "dev-payment-service",
    "prod-payment-service",

    "dev-database-data-pipeline-vbpl",
    "prod-database-data-pipeline-vbpl",

    "dev-data-pipeline-vbplnew",
    "prod-data-pipeline-vbplnew",

    "dev-data-pipeline-phapdien",
    "prod-data-pipeline-phapdien",

    "dev-data-pipeline-user-documents",
    "prod-data-pipeline-user-documents",

  ]
}

variable "setting_service_projects" {
  type        = list(string)
  description = "Danh sách các project cho setting service"
  default = [
    "dev-database-setting-service",
    "prod-database-setting-service"
  ]
}
