// CWE-94: Code Injection – user input passed to eval/Function constructors
// is executed as code. The source is request params; safe code uses literals.

import { Request } from "express";

function vuln(req: Request) {
  const code = req.query.get("code") as string;
  // ruleid: typescript-code-injection
  eval(code);
  const fn = req.params.get("fn") as string;
  // ruleid: typescript-code-injection
  new Function(fn)();
  const body = req.body.get("body") as string;
  // ruleid: typescript-code-injection
  Function(body)();
  const q = location.search;
  // ruleid: typescript-code-injection
  eval(q);
}

function safe() {
  // ok: typescript-code-injection
  eval("2+2");
  // ok: typescript-code-injection
  new Function("return 1")();
  // ok: typescript-code-injection
  Function("a", "return a+1")();
  // ok: typescript-code-injection
  eval("Math.random()");
}
