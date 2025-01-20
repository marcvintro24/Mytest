variable "source_registry" {
  description = "Source Helm repository URL"
  type        = string
}
variable "target_registry" {
  description = "Target GCP Artifact Registry URL"
  type        = string
}
variable "helm_chart_list" {
  description = "List of Helm charts to copy"
  type        = list(string)
}
variable "sa_email" {
  description = "Service account email for permissions"
  type        = string
}
