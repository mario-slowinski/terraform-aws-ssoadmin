variable "account_assignments" {
  type = list(object({
    instance_arn   = optional(string) # The Amazon Resource Name (ARN) of the SSO Instance. Use the one from module if not given.
    permission_set = optional(string) # The ARN of the Permission Set or name of permission set in this module.
    principal      = string           # A name for an object in SSO, such as a user or group.
    principal_id   = string           # An identifier for an object in SSO, such as a user or group. PrincipalIds are GUIDs
    principal_type = string           # The entity type for which the assignment will be created. Valid values: USER, GROUP.
    target_id      = optional(string) # An AWS account identifier, typically a 10-12 digit string.
    target_type    = optional(string) # The entity type for which the assignment will be created. Valid values: AWS_ACCOUNT.
  }))
  description = "List of Single Sign-On (SSO) Account Assignments."
  default = [{
    principal      = null,
    principal_id   = null,
    principal_type = null,
  }]
}
