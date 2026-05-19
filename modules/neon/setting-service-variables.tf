variable "setting_service_projects" {
  type        = list(string)
  description = "Danh sách project cho setting service"
  default = [
    "dev-setting-service",
    "prod-setting-service"
  ]
}