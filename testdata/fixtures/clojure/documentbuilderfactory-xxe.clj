;; Parsing untrusted XML with clojure.xml without disabling DOCTYPE
;; declarations allows XXE. Safe code avoids parse on untrusted input.
(ns xml.fixture
  (:require [clojure.xml :as xml]))
;; ruleid: documentbuilderfactory-xxe
(defn parse-a [i] ( do (clojure.xml/parse i)  ))
;; ruleid: documentbuilderfactory-xxe
(defn parse-b [input] ( do (clojure.xml/parse input)  ))
;; ruleid: documentbuilderfactory-xxe
(defn parse-c [x] ( do (clojure.xml/parse x)  ))
;; ok: documentbuilderfactory-xxe
(defn render-a [i] ( do (str i)  ))
;; ok: documentbuilderfactory-xxe
(defn render-b [input] ( do (str input)  ))
;; ok: documentbuilderfactory-xxe
(defn identity-x [x] ( do (str x)  ))
