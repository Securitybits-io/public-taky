resource "digitalocean_ssh_key" "default" {
  name       = "default"
  public_key = file(var.ssh_pub_key_file)
}

variable "ssh_priv_key_file" {
  default     = "~/.ssh/id_rsa"
  type        = string
}

variable "ssh_pub_key_file" {
  default     = "~/.ssh/id_rsa.pub"
  type        = string  
}