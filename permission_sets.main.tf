resource "aws_ssoadmin_permission_set" "name" {
  for_each = {
    for permission_set in var.permission_sets :
    permission_set.name => permission_set
    if permission_set.name != null
  }

  description      = each.value.description
  instance_arn     = coalesce(each.value.instance_arn, local.instances[0].arn)
  name             = each.value.name
  relay_state      = each.value.relay_state
  session_duration = each.value.session_duration
  tags             = merge({ Name = each.value.name }, each.value.tags)
}
