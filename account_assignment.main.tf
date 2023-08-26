resource "aws_ssoadmin_account_assignment" "principal" {
  for_each = {
    for account_assignment in var.account_assignments :
    account_assignment.principal_id => account_assignment
    if account_assignment.principal_id != null
  }

  instance_arn       = coalesce(each.value.instance_arn, one(local.instances[*].arn))
  permission_set_arn = each.value.permission_set_arn
  principal_id       = each.value.principal_id
  principal_type     = each.value.principal_type
  target_id          = coalesce(each.value.target_id, data.aws_caller_identity.current.account_id)
  target_type        = each.value.target_type
}
