// CWE-89: a Play request's query string concatenated into a statement.
//
// `prepareStatement` with a `?` placeholder is the fix and it is what the safe
// action below uses: the value is sent out of band and cannot change the shape
// of the query. Building the string first throws that away.
package controllers

import java.sql.Connection

class Users(conn: Connection) {

  def byName(request: Request) = Action {
    val name = request.getQueryString("name")
    // ruleid: tainted-sql-from-http-request
    conn.prepareStatement("SELECT * FROM users WHERE name = '" + name + "'");
    Ok
  }

  def deleteByName(request: Request) = Action {
    val name = request.getQueryString("name")
    val stmt = conn.createStatement()
    // ruleid: tainted-sql-from-http-request
    stmt.executeUpdate("DELETE FROM users WHERE name = '" + name + "'");
    Ok
  }

  def bound(request: Request) = Action {
    val name = request.getQueryString("name")
    // ok: tainted-sql-from-http-request
    val s = conn.prepareStatement("SELECT * FROM users WHERE name = ?");
    s.setString(1, name.get)
    Ok
  }

  def fixed(request: Request) = Action {
    // ok: tainted-sql-from-http-request
    conn.prepareStatement("SELECT count(*) FROM users");
    Ok
  }
}
