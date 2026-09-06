// CWE-20: req.query without validation
import fs from "fs";
import { Request } from "express";

export function vuln1(req: Request) {
  const q = req.query.q as string;
  // ruleid: typescript-20-validation
  parseInt(q);
}

export function vuln2(req: Request) {
  const id = req.params.id as string;
  // ruleid: typescript-20-validation
  Number(id);
}

export function vuln3(req: Request) {
  const p = req.query.path as string;
  // ruleid: typescript-20-validation
  fs.readFileSync(p);
}

export function safeAllowlist(req: Request) {
  const allowlist = req.query.q as string;
  if (!/^[a-z]+$/.test(allowlist)) return;
  // ok: typescript-20-validation
  parseInt(allowlist);
}

export function safeFixed() {
  // ok: typescript-20-validation
  parseInt("42");
}
