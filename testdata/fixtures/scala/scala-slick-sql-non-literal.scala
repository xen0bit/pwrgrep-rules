// Interpolating request input into Slick sql strings allows SQL
// injection. Bind parameters or allowlist the fragment instead.
import slick.jdbc.MySQLProfile.api._

object SlickNonLiteral {
  def vuln(q: String) = {
    // ruleid: scala-slick-sql-non-literal
    sql"select * from t where name = #$q"
  }
  def vulnAgain(name: String) = {
    // ruleid: scala-slick-sql-non-literal
    sql"select * from t where id = #$name"
  }
  def vulnThird(filter: String) = {
    // ruleid: scala-slick-sql-non-literal
    sql"select * from t where f = #$filter"
  }
  def safe() = {
    // ok: scala-slick-sql-non-literal
    sql"select * from t"
    // ok: scala-slick-sql-non-literal
    sql"select id from t where id = 1"
    // ok: scala-slick-sql-non-literal
    val fixed = "select 1"
  }
}
