// CWE-918: SSRF – user-controlled URL is passed to fetch/axios/http without validation
// allowing attacker to force server to request internal resources.

import { Request } from "express";

async function vuln(req: Request) {
  const url = req.query.get("url") as string;
  // ruleid: typescript-ssrf
  await fetch(url);
  const target = req.params.get("target") as string;
  // ruleid: typescript-ssrf
  await fetch(target);
  const q = location.search;
  // ruleid: typescript-ssrf
  fetch(q);
  const body = req.body.get("body") as string;
  // ruleid: typescript-ssrf
  fetch(body);
}

async function safe() {
  // ok: typescript-ssrf
  await fetch("https://example.com");
  // ok: typescript-ssrf
  await fetch("https://safe.example.com/api");
  // ok: typescript-ssrf
  fetch("https://example.com/static");
}
