variable "project_names" {
  type        = set(string)
  description = "Danh sách tên các dự án cần tạo"
  default = [
    "project-chatbot-by-terraform",
    "project-document-by-terraform"
  ]
}
