module "development" {
  source = "./modules/nginx-environment"   
  environment_name = "dev"
  node_port = 30201
}

module "staging" {
  source = "./modules/nginx-environment"   
  environment_name = "staging"
  node_port = 30202
}

module "production" {
  source = "./modules/nginx-environment"   
  environment_name = "production"
  node_port = 30203
}