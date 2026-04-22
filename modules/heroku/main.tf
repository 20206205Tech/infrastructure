# 1. Tạo Heroku App
resource "heroku_app" "this" {
  name   = var.app_name
  region = var.app_region
  stack  = var.app_stack
}

# 2. Cấu hình Domain (Cần CNAME từ Cloudflare trỏ sang)
resource "heroku_domain" "this" {
  app_id   = heroku_app.this.id
  hostname = var.domain_name
}

# 3. Tạo Pipeline để quản lý CI/CD
resource "heroku_pipeline" "this" {
  name = "${var.app_name}-pipeline"
}

# 4. Gắn App vào Pipeline
resource "heroku_pipeline_coupling" "this" {
  app_id   = heroku_app.this.id
  pipeline = heroku_pipeline.this.id
  stage    = "production"
}

# 5. Kết nối Pipeline với GitHub Repository
resource "herokux_pipeline_github_integration" "this" {
  pipeline_id = heroku_pipeline.this.id
  org_repo    = var.github_org_repo
}

# 6. Cấu hình tự động Deploy khi có code mới ở branch chính
resource "herokux_app_github_integration" "this" {
  app_id      = heroku_app.this.uuid
  branch      = var.github_branch
  auto_deploy = true
  wait_for_ci = true 

  depends_on = [
    heroku_pipeline_coupling.this,
    herokux_pipeline_github_integration.this
  ]
}