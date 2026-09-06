// CWE-22: Path Traversal – unsanitized user input flowing into fs file APIs
// allows attackers to read arbitrary files outside the intended directory.
// The sink is fs.readFile / readFileSync / createReadStream; the source is
// request query/params. The safe versions use hard-coded paths.

import fs from "fs";
import { Request } from "express";

function vuln(req: Request) {
  const p = req.query.get("file") as string;
  // ruleid: typescript-path-traversal
  fs.readFile(p, (err, data) => {});
  const q = req.params.get("path") as string;
  // ruleid: typescript-path-traversal
  fs.readFileSync(q);
  const r = req.body.get("r") as string;
  // ruleid: typescript-path-traversal
  fs.createReadStream(r);
  const s = location.search;
  // ruleid: typescript-path-traversal
  fs.promises.readFile(s);
}

function safe(req: Request) {
  // ok: typescript-path-traversal
  fs.readFile("/tmp/fixed.txt", (e, d) => {});
  // ok: typescript-path-traversal
  fs.readFileSync("/tmp/fixed.txt");
  // ok: typescript-path-traversal
  fs.createReadStream("/tmp/fixed.txt");
  // ok: typescript-path-traversal
  fs.promises.readFile("/tmp/fixed.txt");
}
