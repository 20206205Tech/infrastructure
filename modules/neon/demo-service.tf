resource "neon_project" "demo_service" {
  for_each = toset(var.demo_service_projects)

  org_id    = var.NEON_ORGANIZATION_ID
  name      = each.key
  region_id = "aws-ap-southeast-1"

  history_retention_seconds = 21600
}

# Add new authentication provider for Demo Service
resource "neon_jwks_url" "demo_service_auth_provider" {
  for_each = neon_project.demo_service

  project_id    = each.value.id
  
  # Lấy trực tiếp user mặc định được tạo cùng với project 
  # (An toàn và không bị lỗi phụ thuộc)
  role_names    = [each.value.database_user] 
  
  provider_name = "Supabase"
  jwks_url      = var.supabase_jwks_url
}