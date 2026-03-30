module "db_admin" {
  source  = "api.nullstone.io/nullstone/aws-mss-db-admin/aws"
  version = "~> 0.1.0"

  name     = local.resource_name
  tags     = local.tags
  host     = var.hostname
  port     = var.port
  username = var.admin_username
  password = local.admin_password

  network = {
    vpc_id               = local.vpc_id
    db_security_group_id = var.security_group_name
    security_group_ids   = []
    subnet_ids           = local.private_subnet_ids
  }
}
