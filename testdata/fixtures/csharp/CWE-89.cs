using System.Data.SqlClient;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Fixture {
    public class OrderController : Controller {
        private readonly AppDb _db;

        public IActionResult ByName() {
            string name = Request.Query["name"];
            // ruleid: csharp-sql-built-from-request
            var cmd = new SqlCommand("SELECT * FROM Orders WHERE Name = '" + name + "'", _conn);
            cmd.ExecuteNonQuery();
            return Ok();
        }

        public IActionResult ByCity(string city) {
            // ruleid: csharp-sql-built-from-request
            var cmd = new SqlCommand($"SELECT * FROM Orders WHERE City = '{city}'", _conn);
            cmd.ExecuteReader();
            return Ok();
        }

        public IActionResult ByRegion() {
            string region = Request.Form["region"];
            var text = "SELECT * FROM Orders WHERE Region = '" + region + "'";
            // ruleid: csharp-sql-built-from-request
            _db.Orders.FromSqlRaw(text);
            return Ok();
        }

        public IActionResult Purge(string tenant) {
            // ruleid: csharp-sql-built-from-request
            _db.Database.ExecuteSqlRaw("DELETE FROM Orders WHERE Tenant = '" + tenant + "'");
            return Ok();
        }

        public IActionResult Parameterised(string city) {
            // ok: csharp-sql-built-from-request
            var cmd = new SqlCommand("SELECT * FROM Orders WHERE City = @city", _conn);
            cmd.Parameters.AddWithValue("@city", city);
            return Ok();
        }

        public IActionResult Constant() {
            // ok: csharp-sql-built-from-request
            var cmd = new SqlCommand("SELECT * FROM Orders", _conn);
            return Ok();
        }

        public IActionResult Internal() {
            string table = Config.TableName;
            // ok: csharp-sql-built-from-request
            var cmd = new SqlCommand("SELECT * FROM " + table, _conn);
            return Ok();
        }

        private SqlConnection _conn;
    }
}
