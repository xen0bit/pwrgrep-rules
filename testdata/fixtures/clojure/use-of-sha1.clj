;; SHA1 is broken for integrity and signatures; use SHA-256 or stronger.
;; The rule matches the bare algorithm symbols below.
(ns hash.fixture)
;; ruleid: use-of-sha1
(defn hash-a [i] (MessageDigest/getInstance SHA1))
;; ruleid: use-of-sha1
(defn hash-b [i] (MessageDigest/getInstance SHA-1))
;; ruleid: use-of-sha1
(defn hash-c [i] (java.security.MessageDigest/getInstance SHA1))
;; ok: use-of-sha1
(defn hash-ok [i] (MessageDigest/getInstance SHA256))
;; ok: use-of-sha1
(defn hash-ok2 [i] (MessageDigest/getInstance "SHA-256"))
;; ok: use-of-sha1
(defn hash-ok3 [i] (java.security.MessageDigest/getInstance SHA256))
