resource "digitalocean_droplet" "droplets" {
  image     = "ubuntu-20-04-x64"
  name      = "taky-docker-public-${var.servername}"
  region    = "ams3"
  size      = "s-1vcpu-1gb"
  ssh_keys  = [data.digitalocean_ssh_key.default.id]

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


resource "namecheap_domain_records" "public-airsoftsweden" {
  domain = "airsoftsweden.com"
  mode = "MERGE"

  record {
    hostname = "${var.servername}"
    type = "A"
    address = digitalocean_droplet.droplets.ipv4_address
  }
}
