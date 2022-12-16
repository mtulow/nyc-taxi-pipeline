
# service user
output "snowflake_service_username" {
  value = snowflake_user.user.name
}
# service role
output "snowflake_service_role_name" {
  value = snowflake_role.role.name
}

# database
output "snowflake_database_name" {
  value = snowflake_database.db.name
}
# schema
output "snowflake_schema_name" {
  value = snowflake_schema.schema.name
}
# warehouse
output "snowflake_warehouse_name" {
  value = snowflake_warehouse.wh.name
}