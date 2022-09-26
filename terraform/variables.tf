variable "workspace_iam_roles" {
  type = map(string)
  default = {
    caring-dev  = "arn:aws:iam::182565773517:role/ops-mgmt-admin"
    caring-stg  = "arn:aws:iam::445934931244:role/ops-mgmt-admin"
    caring-prod = "arn:aws:iam::928074183842:role/ops-mgmt-admin"
    caring-main = "arn:aws:iam::556566422951:role/ops-mgmt-admin"
  }
}

variable "TFC_WORKSPACE_NAME" {
  type    = string
  default = ""
}

