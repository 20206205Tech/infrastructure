variable "OCI_TENANCY_OCID" {
  type        = string
  description = "OCID của Tenancy (Thường dùng làm root compartment)"
  default     = "ocid1.tenancy.oc1..aaaaaaaa6orffrgog44dbuiq4zr7p6cmrlcuhybf52djqoqx66hf2whwigtq"
}

variable "OCI_COMPARTMENT_OCID" {
  type        = string
  description = "OCID của Compartment chứa tài nguyên"
  default     = "ocid1.tenancy.oc1..aaaaaaaa6orffrgog44dbuiq4zr7p6cmrlcuhybf52djqoqx66hf2whwigtq"
}

variable "OCI_REGION" {
  type        = string
  description = "Region triển khai"
  default     = "ap-singapore-1"
}


# --- CÁC THÔNG TIN NHẠY CẢM (ĐỒNG BỘ TỪ DOPPLER) ---

variable "OCI_USER_OCID" {
  type        = string
  description = "OCID của User API"
  sensitive   = true
}

variable "OCI_FINGERPRINT" {
  type        = string
  description = "Fingerprint của API Key"
  sensitive   = true
}

variable "OCI_PRIVATE_KEY" {
  type        = string
  description = "Nội dung Private Key để gọi API OCI"
  sensitive   = true
}

variable "OCI_SSH_PUBLIC_KEY" {
  type        = string
  description = "Public Key để SSH vào VPS"
  sensitive   = true
}