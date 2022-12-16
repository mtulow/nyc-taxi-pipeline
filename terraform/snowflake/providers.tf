terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.53.0"

    }
  }
}

provider "snowflake" {
  // required
  username = "mtulow"
  account  = "wd03530"
  region   = "us-central1.gcp"

  // optional, at exactly one must be set
  password               = "${var.password}"
  
#   // optional
#   role      = "..."
#   host      = "..."
#   warehouse = "..."

#   alias = "security_admin"
#   role  = "SECURITYADMIN"
}