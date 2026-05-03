# Tạo một cụm PostgreSQL 15 Managed Database
resource "digitalocean_database_cluster" "postgres_db" {
  name       = "prod-postgres-cluster"
  engine     = "pg"
  version    = "17" # Nâng lên 17 để đồng bộ với Neon
  size       = "db-s-1vcpu-1gb" # Node cơ bản nhất ($15/tháng)
  region     = var.region
  node_count = 1
}

# output "db_connection_uri" {
#   value       = digitalocean_database_cluster.postgres_db.uri
#   sensitive   = true
#   description = "Chuỗi kết nối CSDL."
# }