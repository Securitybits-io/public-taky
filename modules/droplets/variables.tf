variable "servername" {
  type = string
}

variable "ssh_priv_key_file" {
  default     = "~/.ssh/id_rsa"
  type        = string
}
