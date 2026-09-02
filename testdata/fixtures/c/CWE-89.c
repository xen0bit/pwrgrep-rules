/* CWE-89: SQL Injection.
 *
 * In C the query is a char buffer and the templating is sprintf, so the
 * injection is spelled with a %s. The database sees one string and has no way
 * to know which part of it the program wrote and which part arrived from
 * outside.
 */
#include <mysql.h>
#include <sqlite3.h>
#include <stdio.h>
#include <libpq-fe.h>

void lookup(MYSQL *conn, sqlite3 *db, PGconn *pg, const char *name, int id)
{
    char query[512];
    sqlite3_stmt *stmt;

    /* ruleid: c-sql-built-by-sprintf */
    sprintf(query, "SELECT * FROM users WHERE name = '%s'", name);
    mysql_query(conn, query);

    /* ruleid: c-sql-built-by-sprintf */
    snprintf(query, sizeof query, "DELETE FROM sessions WHERE id = %d", id);
    sqlite3_exec(db, query, NULL, NULL, NULL);

    /* ruleid: c-sql-built-by-sprintf */
    snprintf(query, sizeof query, "UPDATE t SET v = '%s' WHERE k = '%s'", name, name);
    PQexec(pg, query);

    /* ruleid: c-sql-built-by-sprintf */
    sprintf(query, "insert into audit (who) values ('%s')", name);
    sqlite3_prepare_v2(db, query, -1, &stmt, NULL);

    /* ok: c-sql-built-by-sprintf */
    sqlite3_prepare_v2(db, "SELECT * FROM users WHERE name = ?", -1, &stmt, NULL);
    sqlite3_bind_text(stmt, 1, name, -1, SQLITE_STATIC);

    /* ok: c-sql-built-by-sprintf */
    mysql_query(conn, "SELECT COUNT(*) FROM users");

    char label[64];
    /* ok: c-sql-built-by-sprintf */
    snprintf(label, sizeof label, "user %s", name);
    puts(label);
}
