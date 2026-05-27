locals {
  default_callback = "https://20206205tech.github.io/auth-callback"

  project_configs = {
    "dev" = {
      # Đặt site_url chính là localhost cho môi trường dev
      site_url     = "http://localhost:3000/auth/callback"
      # Đưa url dự phòng vào danh sách cho phép
      allowed_uris = [local.default_callback]
    }
    "prod" = {
      # Đặt site_url chính là domain thực cho môi trường prod
      site_url     = "https://20206205.tech/auth/callback"
      # Đưa url dự phòng vào danh sách cho phép
      allowed_uris = [local.default_callback]
    }
  }
}

resource "supabase_project" "this" {
  for_each = var.project_names

  organization_id   = var.SUPABASE_ORGANIZATION_ID
  name              = each.value
  database_password = var.SUPABASE_DB_PASSWORD
  region            = "ap-southeast-1"

  lifecycle {
    ignore_changes = [database_password]
  }
}

data "supabase_apikeys" "this" {
  for_each    = supabase_project.this
  project_ref = each.value.id
}

resource "supabase_settings" "this" {
  for_each = supabase_project.this

  project_ref = each.value.id

  auth = jsonencode({
    # # Mặc định là 1 giờ, cấu hình 12 giờ = 43200 giây
    # jwt_exp = 43200

    external_google_enabled   = true
    external_google_client_id = var.GOOGLE_CLIENT_ID
    external_google_secret    = var.GOOGLE_CLIENT_SECRET

    # Lúc này site_url sẽ tự động ăn theo http://localhost:3000... (dev) hoặc https://20206205.tech... (prod)
    site_url = local.project_configs[each.key].site_url

    # Dùng join để biến list thành string cách nhau bởi dấu phẩy
    uri_allow_list = join(",", distinct(concat(
      [local.project_configs[each.key].site_url],
      local.project_configs[each.key].allowed_uris
    )))

    smtp_host        = var.SMTP_HOST
    smtp_port        = var.SMTP_PORT
    smtp_user        = var.SMTP_USERNAME
    smtp_pass        = var.SMTP_PASSWORD
    smtp_admin_email = var.SMTP_ADMIN_EMAIL
    smtp_sender_name = var.SMTP_SENDER_NAME

    # --- CẤU HÌNH RATE LIMIT ---
    rate_limit_email_sent = 100

    # =========================================================
    # --- CẤU HÌNH ĐỊNH DẠNG EMAIL XÁC NHẬN (CONFIRMATION) ---
    # =========================================================
    mailer_templates_confirmation_subject = "Xác nhận đăng ký tài khoản"
    mailer_templates_confirmation_content = <<-EOT
      <div style="font-family: sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto;">
        <h2>Xác nhận đăng ký tài khoản</h2>
        <p>Chào bạn,</p>
        <p>Cảm ơn bạn đã đăng ký tài khoản. Vui lòng nhấn vào nút bên dưới để xác nhận địa chỉ email của bạn:</p>
        <br>
        <p style="text-align: center;">
          <a style="background-color: #04aa6d; color: white; padding: 12px 24px; text-decoration: none; border-radius: 12px; font-weight: bold; display: inline-block;" href="{{ .ConfirmationURL }}" target="_blank">
            &#128073; Xác nhận tài khoản
          </a>
        </p>
        <br>
        <hr style="border: none; border-top: 1px solid #eee; margin: 20px 0;">
        <p style="font-size: 14px; color: #666;"><em>Nếu nút bấm không hoạt động, vui lòng copy và dán đường dẫn sau vào trình duyệt:</em></p>
        <p style="font-size: 14px; word-break: break-all; color: #04aa6d;">
          <a href="{{ .ConfirmationURL }}" style="color: #04aa6d;">{{ .ConfirmationURL }}</a>
        </p>
      </div>
    EOT

    # =========================================================
    # --- CẤU HÌNH ĐỊNH DẠNG EMAIL QUÊN MẬT KHẨU (RECOVERY) ---
    # =========================================================
    mailer_templates_recovery_subject = "Yêu cầu đặt lại mật khẩu"
    mailer_templates_recovery_content = <<-EOT
      <div style="font-family: sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto;">
        <h2>Đặt lại mật khẩu của bạn</h2>
        <p>Chào bạn,</p>
        <p>Chúng tôi nhận được yêu cầu đặt lại mật khẩu cho tài khoản của bạn. Vui lòng nhấn vào nút bên dưới để tiến hành tạo mật khẩu mới:</p>
        <br>
        <p style="text-align: center;">
          <a style="background-color: #04aa6d; color: white; padding: 12px 24px; text-decoration: none; border-radius: 12px; font-weight: bold; display: inline-block;" href="{{ .ConfirmationURL }}" target="_blank">
            &#128073; Đặt lại mật khẩu
          </a>
        </p>
        <br>
        <hr style="border: none; border-top: 1px solid #eee; margin: 20px 0;">
        <p style="font-size: 14px; color: #666;"><em>Nếu nút bấm không hoạt động, vui lòng copy và dán đường dẫn sau vào trình duyệt:</em></p>
        <p style="font-size: 14px; word-break: break-all; color: #04aa6d;">
          <a href="{{ .ConfirmationURL }}" style="color: #04aa6d;">{{ .ConfirmationURL }}</a>
        </p>
        <p style="font-size: 14px; color: #999; margin-top: 20px;">Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email này.</p>
      </div>
    EOT
  })
}