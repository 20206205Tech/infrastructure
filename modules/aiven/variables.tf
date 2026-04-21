variable "AIVEN_PARENT_ID" {
  type        = string
  description = "ID của thư mục cha trên Aiven"
  default     = "a590113c7a45"
}

variable "AIVEN_TOKEN" {
  type        = string
  description = "Token xác thực API của Aiven"
  sensitive   = true
}