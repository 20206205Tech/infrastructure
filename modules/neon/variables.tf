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

 



    "dev-database-data-pipeline-vbpl",
    "prod-database-data-pipeline-vbpl",

    "dev-data-pipeline-vbplnew",
    "prod-data-pipeline-vbplnew",

    "dev-data-pipeline-phapdien",
    "prod-data-pipeline-phapdien",

    "dev-data-pipeline-user-documents",
    "prod-data-pipeline-user-documents",








    "dev-payment-service",
    "prod-payment-service",





    "dev-conversation-service",
    "prod-conversation-service",

    
    "dev-persona-service",
    "prod-persona-service",






    "dev-document-service",
    "prod-document-service",

    "dev-chatbot-service",
    "prod-chatbot-service",

    "dev-chat-history",
    "prod-chat-history",



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
