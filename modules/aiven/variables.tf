variable "AIVEN_PARENT_ID" {
  type        = string
  description = "ID của thư mục cha trên Aiven"
  sensitive   = true
}

variable "AIVEN_TOKEN" {
  type        = string
  description = "Token xác thực API của Aiven"
  sensitive   = true
}