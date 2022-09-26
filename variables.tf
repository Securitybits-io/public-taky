variable "do_token" {
  type        = string
  sensitive   = true
}

variable "ssh_priv_key_file" {
  default     = "~/.ssh/id_rsa"
  type        = string
}

variable "namecheap_username" {
  type = string
}

variable "namecheap_api_key" {
  type        = string
  sensitive   = true
}
