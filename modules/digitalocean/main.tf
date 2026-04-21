# # Khai báo SSH Key trên DigitalOcean để gán vào Droplet
# resource "digitalocean_ssh_key" "my_key" {
#   name       = "ssh-key-terraform"
#   public_key = var.OCI_SSH_PUBLIC_KEY
# }

# # Tạo Droplet (VPS)
# resource "digitalocean_droplet" "web" {
#   name     = "vps-do-free-tier-style" # Tên định danh
#   image    = var.droplet_image
#   region   = var.region
#   size     = var.droplet_size
#   ssh_keys = [digitalocean_ssh_key.my_key.id]

# }


