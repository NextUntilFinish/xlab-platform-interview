module "development" {
  source = "./modules/nginx-environment"   
  environment_name = "dev"
  label = "DevNginx"
  namespace = "dev"
  node_port = 30202
}

module "staging" {
  source = "./modules/nginx-environment"   
  environment_name = "staging"
  label = "StagingNginx"
  namespace = "stg"
  node_port = 30202
}

module "production" {
  source = "./modules/nginx-environment"   
  environment_name = "production"
  label = "ProductionNginx"
  namespace = "prd"
  node_port = 30203
}