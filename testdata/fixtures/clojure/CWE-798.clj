;; CWE-798: Hardcoded
(ns fixture.cwe798)
;; ruleid: clojure-hardcoded
(def password "hunter2")
;; ruleid: clojure-hardcoded
(def api-key "ak_s3cr3t123")
;; ruleid: clojure-hardcoded
(def secret-token "t0k3n123")
;; ok: clojure-hardcoded
(def password "password")
;; ok: clojure-hardcoded
(def username "hunter2")
;; ok: clojure-hardcoded
(def api-key "API_KEY")
