resource "digitalocean_droplet" "droplets" {
  image     = "ubuntu-20-04-x64"
  name      = "taky-docker-public-${var.servername}"
  region    = "ams3"
  size      = "s-1vcpu-1gb"
}