variable "source_registry" {}
variable "target_registry" {}
variable "helm_chart_list" {
  type = list(string)
}
variable "sa_email" {}

resource "null_resource" "copy_helm_charts" {
  provisioner "local-exec" {
    command = <<EOT
    gcloud auth activate-service-account ${var.sa_email} --key-file=/path/to/key.json

    # Add source Helm repository
    helm repo add source ${var.source_registry}
    helm repo update

    for chart in ${join(" ", var.helm_chart_list)}; do
      # Pull the Helm chart from the source repository
      helm pull source/$chart --untar
      
      # Push the chart to the target Artifact Registry
      helm push $chart.tar.gz oci://${var.target_registry}
    done
    EOT
  }
}
