;; CWE-78: OS Command Injection – user input passed to shell/sh
;; allows arbitrary command execution. Safe code uses literals.

(ns fixture.cwe78
  (:require [clojure.java.shell :refer [sh]]))

(defn vuln [request]
  (let [cmd (get-in request [:params :cmd])]
    ;; ruleid: clojure-command-injection
    (sh cmd))
  (let [arg (get-in request [:params :arg])]
    ;; ruleid: clojure-command-injection
    (clojure.java.shell/sh arg))
  (let [body (get-in request [:params :body])]
    ;; ruleid: clojure-command-injection
    (sh "echo" body)))

(defn safe []
  ;; ok: clojure-command-injection
  (sh "ls" "-la")
  ;; ok: clojure-command-injection
  (clojure.java.shell/sh "echo" "hi")
  ;; ok: clojure-command-injection
  (sh "echo" "fixed"))
