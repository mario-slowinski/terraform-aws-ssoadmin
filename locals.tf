locals {
  instances = [for index, arn in data.aws_ssoadmin_instances.instance.arns :
    {
      "arn"               = arn,
      "identity_store_id" = data.aws_ssoadmin_instances.instance.identity_store_ids[index]
    }
  ]
}
