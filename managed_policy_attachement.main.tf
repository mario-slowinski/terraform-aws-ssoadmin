resource "aws_ssoadmin_managed_policy_attachment" "name" {
  for_each = {
    for index, permission_set in var.permission_sets :
    join(":", [
      permission_set.name,
      permission_set.managed_policy,
    ]) => permission_set
    if permission_set.managed_policy_arn != null
  }

  instance_arn       = coalesce(each.value.instance_arn, local.instances[0].arn)
  permission_set_arn = aws_ssoadmin_permission_set.name[each.value.name].arn
  managed_policy_arn = each.value.managed_policy_arn

  depends_on = [
    aws_ssoadmin_permission_set.name,
  ]
}
