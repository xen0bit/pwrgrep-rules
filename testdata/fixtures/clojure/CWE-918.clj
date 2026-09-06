;; CWE-918: SSRF
(ns fixture.cwe918)
(defn vuln [user]
  ;; ruleid: clojure-ssrf
  (slurp user)
  ;; ruleid: clojure-ssrf
  (http/get user)
  ;; ok: clojure-ssrf
  (slurp "https://example.com")
  ;; ok: clojure-ssrf
  (http/get "https://api.example.com/health"))
