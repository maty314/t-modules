module "helm" {
  source = "git::git@gitlab.poincenot.net:infra/provisioner/modules.git//helm"

  cluster_name  = var.environments[terraform.workspace].cluster_name
  domain_name   = var.environments[terraform.workspace].domain_name
  helm_releases = var.environments[terraform.workspace].helm_releases
  region        = var.environments[terraform.workspace].region
}