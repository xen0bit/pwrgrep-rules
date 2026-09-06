// CWE-352: CSRF fetch POST without token
export function vulnFetch() {
  // ruleid: typescript-csrf
  fetch("/api/transfer", { method: "POST", body: JSON.stringify({ amount: 100 }) });
  // ruleid: typescript-csrf
  fetch("/api/update", { method: "POST", headers: { "Content-Type": "application/json" }, body: "{}" });
  // ruleid: typescript-csrf
  axios.post("/api/delete", { id: 1 });
}

export function safeFetch(token: string) {
  // ok: typescript-csrf
  fetch("/api/transfer", { method: "POST", headers: { "X-CSRF-Token": token }, body: "{}" });
  // ok: typescript-csrf
  fetch("/api/update", { method: "POST", headers: { "csrfToken": token } });
}

declare const axios: any;
