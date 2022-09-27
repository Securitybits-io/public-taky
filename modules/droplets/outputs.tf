output "instance_ip_addr" {
  value = digitalocean_droplet.droplets.ipv4_address
}