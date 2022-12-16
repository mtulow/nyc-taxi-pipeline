

variable "password" {
  description = "Snowsql password."
  sensitive = true
}

# Snowflake security admin
variable "snowflake_security_admin" {
  description = "Snowflake security admin role"
  default = "SECURITYADMIN"
}
