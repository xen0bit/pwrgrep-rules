// overrideSql with a dynamic query string allows SQL injection.
// Interpolate only allowlisted fragments or use lifted queries instead.
import slick.jdbc.MySQLProfile.api._

object SlickOverride {
  def vuln[T](model: TableQuery[Table[T]], q: String): Unit = {
    // ruleid: scala-slick-overrideSql-literal
    model.overrideSql(q, "extra")
  }
  def vulnAgain[T](model: TableQuery[Table[T]], stmt: String): Unit = {
    // ruleid: scala-slick-overrideSql-literal
    model.overrideSql(stmt, "extra")
  }
  def vulnThird[T](model: TableQuery[Table[T]], built: String): Unit = {
    // ruleid: scala-slick-overrideSql-literal
    model.overrideSql(built, "extra")
  }
  def safe[T](model: TableQuery[Table[T]]): Unit = {
    // ok: scala-slick-overrideSql-literal
    model.overrideSql("select 1", "extra")
    // ok: scala-slick-overrideSql-literal
    model.overrideSql("select id from t", "extra")
    // ok: scala-slick-overrideSql-literal
    val fixed = "select 1"
  }
}
