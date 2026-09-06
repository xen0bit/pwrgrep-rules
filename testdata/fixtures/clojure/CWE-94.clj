;; CWE-94/89: Code Injection – eval/load-string with user input
;; can execute arbitrary Clojure code. Safe code uses literals.

(ns fixture.cwe94)

(defn vuln [request]
  (let [code (get-in request [:params :code])]
    ;; ruleid: clojure-code-injection
    (eval code)
    ;; ruleid: clojure-code-injection
    (load-string code))
  (let [expr (get-in request [:params :expr])]
    ;; ruleid: clojure-code-injection
    (clojure.core/eval expr)))

(defn safe []
  ;; ok: clojure-code-injection
  (eval "(+ 1 2)")
  ;; ok: clojure-code-injection
  (load-string "(+ 1 2)")
  ;; ok: clojure-code-injection
  (clojure.core/eval "(+ 1 2)"))
