

# variable "demo_service_projects" {
#   type        = list(string)
#   description = "Danh sách project cho demo service"
#   default = [
#     "dev-demo-service",
#     "prod-demo-service"
#   ]
# }
# # Add new authentication provider
# # https://cmtvbkvxwspkdstrcrfm.supabase.co/auth/v1/.well-known/jwks.json



# variable "supabase_jwks_url" {
#   type        = string
#   description = "JWKS URL cho Supabase Authentication Provider"
#   default     = "https://cmtvbkvxwspkdstrcrfm.supabase.co/auth/v1/.well-known/jwks.json"
# }

# resource "neon_project" "this" {
#   for_each = toset(var.projects)

#   org_id    = var.NEON_ORGANIZATION_ID
#   name      = each.key
#   region_id = "aws-ap-southeast-1"

#   history_retention_seconds = 21600
# }

# # Add new authentication provider
# resource "neon_jwks_url" "this_auth_provider" {
#   for_each = neon_project.this

#   project_id    = each.value.id
#   jwks_url      = var.supabase_jwks_url
#   provider_name = "Supabase"
  
#   # Mapping JWKS này cho (các) database role.
#   # Ở đây sử dụng luôn role mặc định được tạo cùng với nhánh chính của project.
#   # Nếu Supabase RLS của bạn sử dụng role riêng như "authenticated", bạn có thể đổi thành: role_names = ["authenticated"]
#   role_names    = [each.value.branch[0].role_name]
# }



# resource "neon_project" "setting_service" {
#   for_each = toset(var.setting_service_projects)

#   org_id    = var.NEON_ORGANIZATION_ID
#   name      = each.key
#   region_id = "aws-ap-southeast-1"

#   history_retention_seconds = 21600
# }

# resource "neon_jwks_url" "setting_service_auth_provider" {
#   for_each = neon_project.setting_service

#   project_id    = each.value.id
#   jwks_url      = var.supabase_jwks_url
#   provider_name = "Supabase"
  
#   role_names    = [each.value.branch[0].role_name]
# }




# provision Stack's JWKs URL for the default role.
resource "neon_project" "example" {
  name = "foo"
}

resource "neon_jwks_url" "default" {
  project_id    = neon_project.example.id
  role_names    = [neon_project.example.database_user]
  provider_name = "Stack"
  # replace the URL with the one which corresponds to your Stack project
  # see details: https://neon.tech/docs/guides/neon-rls-authorize-stack-auth
  jwks_url   = "https://api.stack-auth.com/api/v1/projects/e3475923-a0b3-4cbb-a70f-b3071985a11d/.well-known/jwks.json"
  depends_on = [neon_project.example]
}

# provision Stack's JWKs URL for the custom branch and the custom roles.
resource "neon_branch" "custom" {
  project_id = neon_project.example.id
  name       = "bar"
}

locals {
  custom_roles = ["r0", "r1", "r2"]
}

resource "neon_role" "custom" {
  for_each   = toset(local.custom_roles)
  project_id = neon_project.example.id
  branch_id  = neon_branch.custom.id
  name       = each.key
}

resource "neon_jwks_url" "custom" {
  project_id    = neon_project.example.id
  branch_id     = neon_branch.custom.id
  role_names    = local.custom_roles
  provider_name = "Stack"
  # replace the URL with the one which corresponds to your Stack project
  # see details: https://neon.tech/docs/guides/neon-rls-authorize-stack-auth
  jwks_url   = "https://api.stack-auth.com/api/v1/projects/e3475923-a0b3-4cbb-a70f-b3071985a11d/.well-known/jwks.json"
  depends_on = [neon_project.example, neon_branch.custom, neon_role.custom]
}