using System.DirectoryServices;
using Microsoft.AspNetCore.Mvc;

namespace Fixture {
    public class DirectoryController : Controller {
        public IActionResult Find(string user) {
            var searcher = new DirectorySearcher(_root);
            // ruleid: csharp-ldap-filter-from-request
            searcher.Filter = "(&(objectClass=user)(cn=" + user + "))";
            return Ok(searcher.FindAll());
        }

        public IActionResult Lookup() {
            string cn = Request.Query["cn"];
            // ruleid: csharp-ldap-filter-from-request
            var searcher = new DirectorySearcher(_root, $"(cn={cn})");
            return Ok(searcher.FindOne());
        }

        public IActionResult All() {
            var searcher = new DirectorySearcher(_root);
            // ok: csharp-ldap-filter-from-request
            searcher.Filter = "(&(objectClass=user))";
            return Ok(searcher.FindAll());
        }

        private DirectoryEntry _root;
    }
}
