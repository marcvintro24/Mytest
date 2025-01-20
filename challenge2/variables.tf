variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "The region for the Google Cloud resources"
  type        = string
}

variable "service_account_key" {
  description = "Path to the service account key JSON file"
  type        = string
}

variable "helm_chart_list" {
  description = "List of Helm charts to copy"
  type        = list(string)
}

variable "source_registry" {
  description = "The source registry for Helm charts"
  type        = string
  default     = "https://reference.gcr.io/helm"
}

variable "target_registry" {
  description = "The target registry for Helm charts"
  type        = string
}

variable "sa_email" {
  description = "The email of the service account to use for authentication"
  type        = string
}
