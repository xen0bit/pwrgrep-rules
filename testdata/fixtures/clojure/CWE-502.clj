;; CWE-502: Deserialization of Untrusted Data via read-string
;; read-string without :exclude can evaluate arbitrary code

(ns fixture.cwe502)

(defn vuln-read [x]
  ;; ruleid: read-string-unsafe
  (read-string x)
  x)

(defn vuln-read2 [y]
  ;; ruleid: read-string-unsafe
  (read-string y)
  y)

(defn vuln-read3 [z]
  ;; ruleid: read-string-unsafe
  (read-string z)
  z)

(defn vuln-read4 [a]
  ;; ruleid: read-string-unsafe
  (read-string a)
  a)

;; ok: read-string-unsafe
(defn safe-outside [z]
  (str z))

;; ok: read-string-unsafe
(defn safe-plain [s]
  (pr-str s))

;; ok: read-string-unsafe
(defn safe-pr [s]
  (pr-str s))
