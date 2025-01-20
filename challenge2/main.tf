terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "google" {
  credentials = file(var.service_account_key)
  project     = var.project_id
  region      = var.region
}

module "copy_helm_charts" {
  source            = "./modules/helm_chart_copy"
  source_registry   = var.source_registry
  target_registry   = var.target_registry
  helm_chart_list   = var.helm_chart_list
  sa_email          = var.sa_email
}
