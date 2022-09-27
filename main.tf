module "taky-yellow" {
  source        = "./modules/droplets"
  servername    = "yellow"

  do_token              = var.do_token 
  ssh_priv_key_file     = var.ssh_priv_key_file
  namecheap_username    = var.namecheap_username
  namecheap_api_key     = var.namecheap_api_key
}

module "taky-red" {
  source        = "./modules/droplets"
  servername    = "red"

  do_token              = var.do_token 
  ssh_priv_key_file     = var.ssh_priv_key_file
  namecheap_username    = var.namecheap_username
  namecheap_api_key     = var.namecheap_api_key
}

module "taky-blue" {
  source        = "./modules/droplets"
  servername    = "blue"

  do_token              = var.do_token 
  ssh_priv_key_file     = var.ssh_priv_key_file
  namecheap_username    = var.namecheap_username
  namecheap_api_key     = var.namecheap_api_key
}
