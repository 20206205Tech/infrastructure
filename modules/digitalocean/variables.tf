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
  default = "s-1vcpu-1gb" # Gói thấp nhất
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