variable "aiven_parent_id" {
  type        = string
  description = "ID của thư mục cha trên Aiven"
  sensitive   = true
}

variable "aiven_token" {
  type        = string
  description = "Token xác thực API của Aiven"
  sensitive   = true
}