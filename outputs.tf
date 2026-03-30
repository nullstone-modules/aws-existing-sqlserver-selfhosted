output "db_instance_arn" {
  value       = ""
  description = "string ||| ARN of the SqlServer instance"
}

output "db_master_secret_name" {
  value       = var.admin_password_secret_name
  description = "string ||| The name of the secret in AWS Secrets Manager containing the password"
}

output "db_hostname" {
  value       = var.hostname
  description = "string ||| The hostname to access the SqlServer instance."
}

output "db_port" {
  value       = var.port
  description = "string ||| The port to access the SqlServer instance."
}

output "db_endpoint" {
  value       = "${var.hostname}:${var.port}"
  description = "string ||| The endpoint URL to access the SqlServer instance."
}

output "db_security_group_id" {
  value       = try(data.aws_security_group.this[0].id, "")
  description = "string ||| The ID of the security group attached to the SqlServer instance."
}

output "db_admin_function_name" {
  value       = module.db_admin.function_name
  description = "string ||| AWS Lambda Function name for database admin utility"
}
