;; CWE-89: SQLi
(ns fixture.cwe89)
(defn vuln [db user]
  ;; ruleid: clojure-sqli
  (clojure.java.jdbc/query db user)
  ;; ruleid: clojure-sqli
  (jdbc/query db user)
  ;; ruleid: clojure-sqli
  (jdbc/execute! db user)
  ;; ok: clojure-sqli
  (clojure.java.jdbc/query db "SELECT * FROM t WHERE id=1")
  ;; ok: clojure-sqli
  (jdbc/query db "SELECT * FROM users"))
