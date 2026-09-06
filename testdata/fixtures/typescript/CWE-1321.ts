// CWE-1321: Prototype pollution
function vuln(obj: any, key: string, value: any) {
  // ruleid: typescript-prototype-pollution
  obj["__proto__"] = value;
  // ruleid: typescript-prototype-pollution
  obj["constructor.prototype"] = value;
  // ruleid: typescript-prototype-pollution
  obj["prototype"] = value;
}
function safe(obj: any) {
  // ok: typescript-prototype-pollution
  obj["fixed"] = 1;
  // ok: typescript-prototype-pollution
  obj["safeKey"] = 2;
}
