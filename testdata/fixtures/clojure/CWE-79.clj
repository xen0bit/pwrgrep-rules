;; CWE-79: XSS
(ns fixture.cwe79)
(defn vuln [user]
  ;; ruleid: clojure-xss
  (hiccup.core/html user)
  ;; ruleid: clojure-xss
  (selmer.parser/render "t.html" user)
  ;; ok: clojure-xss
  (hiccup.core/html "hello")
  ;; ok: clojure-xss
  (selmer.parser/render "t.html" "fixed"))
