// CWE-601: Open redirect
import { Request, Response } from 'express';

function vuln(req: Request, res: Response) {
  const url = req.query.get("url") as string;
  // ruleid: typescript-open-redirect
  res.redirect(url);
  const target = req.params.get("next") as string;
  // ruleid: typescript-open-redirect
  window.location.href = target;
  const q = location.search;
  // ruleid: typescript-open-redirect
  window.location.assign(q);
}
function safe(req: Request, res: Response) {
  // ok: typescript-open-redirect
  res.redirect("https://example.com");
  // ok: typescript-open-redirect
  window.location.href = "https://example.com";
}
