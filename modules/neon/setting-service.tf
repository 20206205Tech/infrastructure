# resource "neon_project" "setting_service" {
#   for_each = toset(var.setting_service_projects)

#   org_id    = var.NEON_ORGANIZATION_ID
#   name      = each.key
#   region_id = "aws-ap-southeast-1"

#   history_retention_seconds = 21600
# }