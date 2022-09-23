module "yellow" {
  source        = "./modules/droplets"
  servername    = "yellow"
  do_token      = var.do_pat 
}

module "red" {
  source        = "./modules/droplets"
  servername    = "red"
  do_token      = var.do_pat 
}

module "blue" {
  source        = "./modules/droplets"
  servername    = "blue"
  do_token      = var.do_pat 
}