# Create database
resource "snowflake_database" "db" {
  name     = "TF_DEMO_DB"
}
# Create warehouse
resource "snowflake_warehouse" "wh" {
  name           = "TF_DEMO_WH"
  warehouse_size = "xsmall"

  auto_suspend = 60

  query_acceleration_max_scale_factor = 0
}

# Create snowflake service user
resource "snowflake_role" "role" {
  # provider = var.snowflake_security_admin
  name     = "TF_DEMO_SVC_ROLE"
}

# Grant database access to role
resource "snowflake_database_grant" "grant" {
  # provider          = var.snowflake_security_admin
  database_name     = snowflake_database.db.name
  privilege         = "USAGE"
  roles             = [snowflake_role.role.name]
  with_grant_option = false
}

# Create schema
resource "snowflake_schema" "schema" {
  database   = snowflake_database.db.name
  name       = "TF_DEMO_SCHEMA"
  is_managed = false
}

# Grant schema access to service role
resource "snowflake_schema_grant" "grant" {
    # provider          = var.snowflake_security_admin
    database_name     = snowflake_database.db.name
    schema_name       = snowflake_schema.schema.name
    privilege         = "USAGE"
    roles             = [snowflake_role.role.name]
    with_grant_option = false
}

# Grant warehouse access to service role
resource "snowflake_warehouse_grant" "grant" {
    # provider          = var.snowflake_security_admin
    warehouse_name    = snowflake_warehouse.wh.name
    privilege         = "USAGE"
    roles             = [snowflake_role.role.name]
    with_grant_option = false
}

# # Generate 
# resource "tls_private_key" "svc_key" {
#     algorithm = "RSA"
#     rsa_bits  = 2048
# }

# Create service user
resource "snowflake_user" "user" {
    # provider          = snowflake.security_admin
    name              = "tf_demo_user"
    default_warehouse = snowflake_warehouse.wh.name
    default_role      = snowflake_role.role.name
    default_namespace = "${snowflake_database.db.name}.${snowflake_schema.schema.name}"
    # rsa_public_key    = substr(tls_private_key.svc_key.public_key_pem, 27, 398)
}

# Grant service role to service user
resource "snowflake_role_grants" "grants" {
    # provider  = var.snowflake_security_admin
    role_name = snowflake_role.role.name
    users     = [snowflake_user.user.name]
}