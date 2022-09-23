module "yellow" {
  source        = "./modules/droplets"
  servername    = "yellow"

  do_token              = var.do_token 
  ssh_priv_key_file     = var.ssh_priv_key_file
  ssh_pub_key_file      = var.ssh_pub_key_file
  //namecheap_username    = var.namecheap_username
  //namecheap_api_key     = var.namecheap_api_key
}

module "red" {
  source        = "./modules/droplets"
  servername    = "red"

  do_token              = var.do_token 
  //ssh_priv_key_file     = var.ssh_priv_key_file
  //ssh_pub_key_file      = var.ssh_pub_key_file
  //namecheap_username    = var.namecheap_username
  //namecheap_api_key     = var.namecheap_api_key
}

module "blue" {
  source        = "./modules/droplets"
  servername    = "blue"

  do_token              = var.do_token 
  //ssh_priv_key_file     = var.ssh_priv_key_file
  //ssh_pub_key_file      = var.ssh_pub_key_file
  //namecheap_username    = var.namecheap_username
  //namecheap_api_key     = var.namecheap_api_key
}



