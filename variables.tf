variable "hostname" {
  type        = string
  description = "The hostname to reach the SQL Server."
}

variable "port" {
  type        = string
  default     = "1433"
  description = "The port to connect to SQL Server."
}

variable "admin_username" {
  type = string

  description = <<EOF
The name of the SQL Server user that has access to administer users.
EOF
}

variable "admin_password_secret_name" {
  type = string

  description = <<EOF
The name of the secret in AWS Secrets Manager containing the admin password as plaintext.
EOF
}

data "aws_secretsmanager_secret" "admin_password" {
  name = var.admin_password_secret_name
}

ephemeral "aws_secretsmanager_secret_version" "admin_password" {
  secret_id = data.aws_secretsmanager_secret.admin_password.id
}

locals {
  admin_password = ephemeral.aws_secretsmanager_secret_version.admin_password.secret_string
}

variable "security_group_name" {
  type        = string
  default     = ""
  description = "The name of the security group attached to the database."
}

data "aws_security_group" "this" {
  count = var.security_group_name == "" ? 0 : 1

  name = var.security_group_name
}
