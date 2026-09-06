// CWE-78: OS Command Injection – user input fed directly to child_process
// execution sinks allows arbitrary OS command execution.
// Sources are req.query / params ; sinks are exec, execSync, spawn.

import * as child_process from "child_process";
import { Request } from "express";

function vuln(req: Request) {
  const cmd = req.query.get("cmd") as string;
  // ruleid: typescript-command-injection
  child_process.exec(cmd);
  const arg = req.params.get("arg") as string;
  // ruleid: typescript-command-injection
  child_process.execSync(arg);
  const body = req.body.get("body") as string;
  // ruleid: typescript-command-injection
  child_process.spawn(body, []);
  const q = location.search;
  // ruleid: typescript-command-injection
  child_process.exec(q);
}

function safe() {
  // ok: typescript-command-injection
  child_process.exec("ls -la");
  // ok: typescript-command-injection
  child_process.execSync("echo hi");
  // ok: typescript-command-injection
  child_process.spawn("ls", ["-la"]);
  // ok: typescript-command-injection
  child_process.execFile("ls", ["-la"]);
}
