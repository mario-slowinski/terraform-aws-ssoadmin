resource "aws_ssoadmin_account_assignment" "principal" {
  for_each = {
    for index, account_assignment in var.account_assignments :
    join(":", [
      account_assignment.principal,
      account_assignment.principal_type,
      account_assignment.permission_set,
    ]) => account_assignment
    if account_assignment.principal != null
  }

  instance_arn       = coalesce(each.value.instance_arn, local.instances[0].arn)
  permission_set_arn = startswith(each.value.permission_set, "arn:aws:sso:") ? each.value.permission_set : local.permission_sets[each.value.permission_set].arn
  principal_id       = each.value.principal_id
  principal_type     = each.value.principal_type
  target_id          = coalesce(each.value.target_id, data.aws_caller_identity.current.account_id)
  target_type        = each.value.target_type != null ? each.value.target_type : "AWS_ACCOUNT"
}
