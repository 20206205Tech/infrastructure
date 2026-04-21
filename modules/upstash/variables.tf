variable "UPSTASH_EMAIL" {
  type        = string
  description = "Email tài khoản Upstash"
  default     = "vuvannghia.work@gmail.com"
}

variable "UPSTASH_API_KEY" {
  type        = string
  description = "API Key để xác thực với Upstash"
  sensitive   = true
}