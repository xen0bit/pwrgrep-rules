// CWE-89: an SQL statement is assembled from a string an app did not choose.
//
// On Android the caller is another app on the phone. An intent's extras are
// whatever the sender put in them, and `SELECT * FROM users WHERE name = '$n'`
// with `n` set to `' OR '1'='1` reads the whole table. The exported activity
// that takes the intent is the front door; nothing in between validates it.
package fixture

import android.app.Activity
import android.content.Intent
import android.database.sqlite.SQLiteDatabase

class Orders : Activity() {

    private lateinit var db: SQLiteDatabase

    fun byName(intent: Intent) {
        val name = intent.getStringExtra("name")
        // ruleid: kotlin-sql-built-from-untrusted-input
        db.rawQuery("SELECT * FROM orders WHERE name = '" + name + "'", null)
    }

    fun byCity(intent: Intent) {
        val city = intent.getStringExtra("city")
        // ruleid: kotlin-sql-built-from-untrusted-input
        db.execSQL("DELETE FROM orders WHERE city = '$city'")
    }

    fun byRegion(intent: Intent) {
        val region = intent.data.toString()
        val text = "SELECT * FROM orders WHERE region = '" + region + "'"
        // ruleid: kotlin-sql-built-from-untrusted-input
        db.rawQuery(text, null)
    }

    fun byTenant(tenant: String) {
        // ok: kotlin-sql-built-from-untrusted-input
        db.rawQuery("SELECT * FROM orders WHERE tenant = ?", arrayOf(tenant))
    }

    fun everything() {
        // ok: kotlin-sql-built-from-untrusted-input
        db.rawQuery("SELECT * FROM orders", null)
    }

    fun byConfigured() {
        val table = Config.tableName
        // ok: kotlin-sql-built-from-untrusted-input
        db.rawQuery("SELECT * FROM " + table, null)
    }
}
