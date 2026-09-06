;; CWE-22: Path Traversal – user-controlled path passed to slurp/reader
;; can read arbitrary files. The sink is slurp; safe code uses literals.

(ns fixture.cwe22)

(defn vuln [request]
  (let [p (get-in request [:params :file])]
    ;; ruleid: clojure-path-traversal
    (slurp p))
  (let [q (get-in request [:params :path])]
    ;; ruleid: clojure-path-traversal
    (slurp q))
  (let [r (get-in request [:query-params :id])]
    ;; ruleid: clojure-path-traversal
    (clojure.java.io/reader r)))

(defn safe []
  ;; ok: clojure-path-traversal
  (slurp "/tmp/fixed.txt")
  ;; ok: clojure-path-traversal
  (slurp "/tmp/other.txt")
  ;; ok: clojure-path-traversal
  (clojure.java.io/reader "/tmp/fixed.txt"))
