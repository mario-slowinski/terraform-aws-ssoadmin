variable "permission_sets" {
  type = list(object({
    description        = optional(string)      # The description of the Permission Set.
    instance_arn       = optional(string)      # The Amazon Resource Name (ARN) of the SSO Instance. Use the one from module if not given.
    name               = string                # (Required, Forces new resource) The Amazon Resource Name (ARN) of the SSO Instance under which the operation will be executed.
    relay_state        = optional(string)      # The relay state URL used to redirect users within the application during the federation authentication process.
    session_duration   = optional(string)      # The length of time that the application user sessions are valid in the ISO-8601 standard. Default: PT1H.
    tags               = optional(map(string)) # Key-value map of resource tags.
    managed_policy     = optional(string)      # The IAM managed policy name to be attached to the Permission Set.
    managed_policy_arn = optional(string)      # The IAM managed policy Amazon Resource Name (ARN) to be attached to the Permission Set.
  }))
  description = "List of Single Sign-On (SSO) Permission Sets."
  default     = [{ name = null, }]
}
