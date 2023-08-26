locals {
  instances = [for index, arn in data.aws_ssoadmin_instances.instance.arns :
    {
      "arn"               = arn,
      "identity_store_id" = data.aws_ssoadmin_instances.instance.identity_store_ids[index]
    }
  ]
  permission_sets = { for name, permission_set in aws_ssoadmin_permission_set.name : name => permission_set }
}
