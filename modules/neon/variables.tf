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

    "dev-code-payment-service",
    "prod-code-payment-service",

    "dev-code-conversation-service",
    "prod-code-conversation-service",

    "dev-code-chatbot-service",
    "prod-code-chatbot-service",
    "dev-chat-history",
    "prod-chat-history",

    "dev-code-document-service",
    "prod-code-document-service",

    "dev-code-persona-service",
    "prod-code-persona-service",


    "new-code-payment-service",
    "new-code-conversation-service",

  ]
}



