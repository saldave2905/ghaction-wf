//S3
resource "aws_s3_bucket" "tcloud_bucket_test" {
  bucket = "${module.workspace_context.workspace_deploy_env[local.workspace]}-tcloud"
  acl    = "public-read"
  tags   = local.tags

}

resource "aws_s3_bucket_policy" "canario-bucket-policy" {
  bucket = aws_s3_bucket.tcloud_bucket_test.id
  policy = data.aws_iam_policy_document.tcloud-test-bucket-policy-document.json
}

data "aws_iam_policy_document" "tcloud-test-bucket-policy-document" {
  depends_on = [aws_s3_bucket.tcloud_bucket_test]

  statement {
    actions = ["s3:GetObject", "s3:ListBucket"]
    resources = [
      aws_s3_bucket.tcloud_bucket_test.arn,
      "${aws_s3_bucket.tcloud_bucket_test.arn}/*"
    ]
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}