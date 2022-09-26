locals {
  service_name = "tcloud_test"
  repo_name    = "tcloud_test"
  workspace    = var.TFC_WORKSPACE_NAME != "" ? trimprefix("${var.TFC_WORKSPACE_NAME}", "ecs-") : "${terraform.workspace}"

  tags = {
    service_name = local.service_name,
    env          = local.workspace,
    terraform    = "true",
    repo_name    = local.repo_name
  }
}