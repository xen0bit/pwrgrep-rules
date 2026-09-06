;; CWE-327: Use of a Broken or Risky Cryptographic Algorithm
;; MD5 is broken and should not be used

(ns fixture.cwe327)

(defn vuln-md5 [input]
  ;; ruleid: use-of-md5
  (MessageDigest/getInstance "MD5")
  ;; ruleid: use-of-md5
  (java.security.MessageDigest/getInstance "MD5")
  ;; ruleid: use-of-md5
  (MessageDigest/getInstance MessageDigestAlgorithms/MD5)
  input)

(defn safe-md5 [input]
  ;; ok: use-of-md5
  (MessageDigest/getInstance "SHA-256")
  ;; ok: use-of-md5
  (java.security.MessageDigest/getInstance "SHA-256")
  input)
