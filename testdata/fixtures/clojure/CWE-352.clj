;; CWE-352: CSRF - POST without anti-forgery
(ns fixture.cwe352
  (:require [compojure.core :refer :all]))

;; ruleid: clojure-csrf
(POST "/transfer" req (str "transferred " (:params req)))

;; ruleid: clojure-csrf
(POST "/update" request (handle-update request))

;; ruleid: clojure-csrf
(POST "/delete" [] "deleted")

;; ok: clojure-csrf
(POST "/safe" req
  (if (= (get-in req [:headers "x-csrf-token"]) anti-forgery-token)
    "ok" "forbidden"))

;; ok: clojure-csrf
(POST "/safe2" [] 
  (wrap-anti-forgery handler))
