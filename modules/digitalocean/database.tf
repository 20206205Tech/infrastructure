resource "digitalocean_database_cluster" "postgres_db" {
  name       = "prod-postgres-cluster"
  engine     = "pg"
  version    = "17" 
  size       = "db-s-1vcpu-1gb" 
  region     = var.region
  node_count = 1
}

# Tự động tạo danh sách các cơ sở dữ liệu dựa trên biến khai báo
resource "digitalocean_database_db" "all_databases" {
  for_each   = toset(var.databases)
  
  cluster_id = digitalocean_database_cluster.postgres_db.id
  name       = each.key
}

# Output chuỗi kết nối tổng (Tùy chọn bỏ comment nếu cần lấy thông tin)
# output "db_connection_uri" {
#   value       = digitalocean_database_cluster.postgres_db.uri
#   sensitive   = true
#   description = "Chuỗi kết nối CSDL tổng."
# }