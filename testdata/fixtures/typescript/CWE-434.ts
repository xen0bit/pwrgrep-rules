// CWE-434: Unrestricted Upload — multer file without allowlist reaches file write/mv
import fs from "fs";
import multer from "multer";
import { Request, Response } from "express";

const upload = multer({ dest: "uploads/" });

export function vuln1(req: Request, res: Response) {
  const f = req.file;
  // ruleid: typescript-434-upload
  fs.rename(f.path, "/uploads/" + f.originalname, () => {});
}

export function vuln2(req: Request, res: Response) {
  const name = req.file.originalname;
  // ruleid: typescript-434-upload
  fs.writeFile("/tmp/" + name, Buffer.from("x"), () => {});
}

export function vuln3(req: Request, res: Response) {
  const file = req.file;
  // ruleid: typescript-434-upload
  file.mv("/uploads/" + file.originalname);
}

export function safeAllowlist(req: Request, res: Response) {
  const f = req.file;
  const ext = f.originalname.split(".").pop();
  if (!["png","jpg","jpeg"].includes(ext)) return res.status(400).send("bad");
  // ok: typescript-434-upload
  fs.rename(f.path, "/uploads/allowed.png", () => {});
}

export function safeFixed(req: Request, res: Response) {
  // ok: typescript-434-upload
  fs.writeFile("/tmp/fixed.png", Buffer.from("fixed"), () => {});
}
