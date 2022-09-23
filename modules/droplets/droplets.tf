resource "digitalocean_droplet" "droplets" {
  image     = "ubuntu-20-04-x64"
  name      = "taky-docker-public-${var.servername}"
  region    = "ams3"
  size      = "s-1vcpu-1gb"

    connection {
      host = self.ipv4_address
      user = "root"
      type = "ssh"
      private_key = file(var.ssh_priv_key_file)
      timeout = "2m"
  }

   provisioner "remote-exec" {
    inline = [
      "echo '${var.servername} :: im up'"
    ]  
  }
}