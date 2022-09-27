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
      "apt update",
      "apt remove -y docker docker-engine docker.io containerd runc",
      "apt install -y ca-certificates curl gnupg lsb-release",
      "mkdir -p /etc/apt/keyrings",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
      "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
      "apt update",
      "apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose"
    ]  
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir --parents /docker/data/taky-data/ssl",
      "mkdir --parents /root/atak",
      "mkdir --parents /root/services"
    ]  
  }

  provisioner "file" {
    source = "docker/secrets/env/${var.servername}.env"
    destination = "/root/atak/.env"
  }

  provisioner "file" {
    source = "docker/compose/public-docker-compose.yml"
    destination = "/root/atak/docker-compose.yml"
  }

  provisioner "file" {
    source      = "docker/secrets/certs"
    destination = "/docker/data/taky-data/ssl"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /root/atak",
      "docker-compose up -d"
    ]  
  }
}

resource "namecheap_domain_records" "public-airsoftsweden" {
  domain = "airsoftsweden.com"
  mode = "MERGE"

  record {
    hostname = "${var.servername}"
    type = "A"
    address =  digitalocean_droplet.droplets.ipv4_address
  }
}
