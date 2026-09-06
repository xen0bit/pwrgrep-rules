// CWE-89: SQLi via template
import { Request } from 'express';

function vuln(req: Request, conn: any) {
  const id = req.query.get("id") as string;
  // ruleid: typescript-sqli
  conn.query(`SELECT * FROM users WHERE id = ${id}`);
  const name = req.params.get("name") as string;
  // ruleid: typescript-sqli
  conn.execute(`SELECT * FROM t WHERE name = '${name}'`);
  const q = location.search;
  // ruleid: typescript-sqli
  db.query(q);
}
function safe(req: Request, conn: any) {
  // ok: typescript-sqli
  conn.query("SELECT * FROM users WHERE id = ?", [1]);
  // ok: typescript-sqli
  conn.execute("SELECT 1");
}
declare const db: any;
