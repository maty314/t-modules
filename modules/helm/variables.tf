########################################################################################################################
## START AWS VARIABLES #################################################################################################
########################################################################################################################
variable "region" {
  description = "AWS region"
  type        = string
}

variable "access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}
########################################################################################################################
## END AWS VARIABLES ###################################################################################################
########################################################################################################################

########################################################################################################################
## START K8S VARIABLES #################################################################################################
########################################################################################################################
variable "domain_name" {
  description = "Domain name for external dns submodule."
  type        = string
  default     = null
}

variable "cluster_name" {
  description = "Name of the cluster to obtain credentials for helm connection"
  type        = string
}

variable "r53_private_zone" {
  description = "Route53 private zone"
  type        = bool
  default     = false
}

variable "loki_host" {
  description = "Grafana loki host"
  type        = string
  default     = null
  sensitive   = true
}

variable "loki_username" {
  description = "Grafana loki username"
  type        = string
  default     = null
  sensitive   = true
}

variable "loki_password" {
  description = "Grafana loki password"
  type        = string
  default     = null
  sensitive   = true
}

########################################################################################################################
## END K8S VARIABLES ###################################################################################################
########################################################################################################################

########################################################################################################################
## START HELM VARIABLES ################################################################################################
########################################################################################################################
variable "helm_releases" {
  description = "Configuration for Helm releases"
  type = map(object({
    name                       = optional(string)
    repository                 = string
    chart                      = optional(string)
    version                    = string
    timeout                    = optional(number, 300)
    values                     = optional(list(string))
    create_namespace           = optional(bool, false)
    namespace                  = optional(string)
    lint                       = optional(bool, false)
    description                = optional(string)
    repository_key_file        = optional(string)
    repository_cert_file       = optional(string)
    repository_username        = optional(string)
    repository_password        = optional(string)
    verify                     = optional(bool, false)
    keyring                    = optional(string, "/.gnupg/pubring.gpg")
    disable_webhooks           = optional(bool, false)
    reuse_values               = optional(bool, false)
    reset_values               = optional(bool, false)
    force_update               = optional(bool, false)
    recreate_pods              = optional(bool, false)
    cleanup_on_fail            = optional(bool, false)
    max_history                = optional(number, 0)
    atomic                     = optional(bool, false)
    skip_crds                  = optional(bool, false)
    render_subchart_notes      = optional(bool, false)
    disable_openapi_validation = optional(bool, false)
    wait                       = optional(bool, true)
    wait_for_jobs              = optional(bool, false)
    dependency_update          = optional(bool, false)
    replace                    = optional(bool, false)
    set                        = optional(map(any))
  }))
}
########################################################################################################################
## END HELM VARIABLES ##################################################################################################
########################################################################################################################






########################################################################################################################
## START MATI CHANGES  ##################################################################################################
########################################################################################################################

variable "cloud" {
  description = "Proveedor de nube: 'aws' o 'huawei'"
  type        = string
}

variable "name" {
  description = "Nombre del release de Helm"
  type        = string
}

variable "repository" {
  description = "URL del repositorio del chart de Helm"
  type        = string
}

variable "chart" {
  description = "Nombre del chart de Helm a desplegar"
  type        = string
}

variable "chart_version" {
  description = "Versión del chart de Helm"
  type        = string
}

variable "namespace" {
  description = "Namespace donde se desplegará el release"
  type        = string
}

variable "values" {
  description = "Lista de archivos values (en formato string)"
  type        = list(string)
  default     = []
}

variable "set" {
  description = "Lista de objetos para definir valores (cada uno con name y value)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "kubeconfig_path_aws" {
  description = "Ruta al kubeconfig para AWS (EKS)"
  type        = string
  default     = "~/.kube/config-aws"
}

variable "kubeconfig_path_huawei" {
  description = "Ruta al kubeconfig para Huawei (CCE)"
  type        = string
  default     = "~/.kube/config-huawei"
}




########################################################################################################################
## END MATI CHANGES  ##################################################################################################
########################################################################################################################
