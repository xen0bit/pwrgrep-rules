# CWE-284: Cloud SQL public database — 0.0.0.0/0 authorized.
# ruleid: gcp-sql-public-database
resource "google_sql_database_instance" "bad1" {
  database_version = "POSTGRES_14"
  ip_configuration {
    authorized_networks {
      value = "0.0.0.0/0"
      name  = "public"
    }
  }
}
# ruleid: gcp-sql-public-database
resource "google_sql_database_instance" "bad2" {
  database_version = "MYSQL_8_0"
  ip_configuration {
    dynamic "authorized_networks" {
      for_each = var.nets
      content {
        value = "0.0.0.0/0"
        name  = "open"
      }
    }
  }
}
# ok: gcp-sql-public-database
resource "google_sql_database_instance" "good1" {
  database_version = "POSTGRES_14"
  ip_configuration {
    authorized_networks {
      value = "10.0.0.0/24"
      name  = "private"
    }
  }
}
# ok: gcp-sql-public-database
resource "google_sql_database_instance" "good2" {
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"
  }
}
# ruleid: gcp-sql-public-database
resource "google_sql_database_instance" "bad3" {
  database_version = "POSTGRES_14"
  region           = "us-central1"
  ip_configuration {
    authorized_networks {
      value = "0.0.0.0/0"
      name  = "allow-all"
    }
  }
}
# ruleid: gcp-sql-public-database
resource "google_sql_database_instance" "bad4" {
  database_version = "MYSQL_8_0"
  ip_configuration {
    authorized_networks {
      value = "0.0.0.0/0"
      name  = "public-open"
    }
    ipv4_enabled = true
  }
}
# ok: gcp-sql-public-database
resource "google_sql_database_instance" "good3" {
  database_version = "POSTGRES_14"
  ip_configuration {
    authorized_networks {
      value = "192.168.0.0/16"
      name  = "private-only"
    }
  }
}
