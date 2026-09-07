;; Passing user-controlled input to clojure.java.shell/sh allows command
;; injection. Safe calls use string literals only.
(ns shell.fixture "shell fixture" (:require [clojure.string :as s] [clojure.java.shell :refer [sh]] [clojure.set :as y] ))
;; ruleid: command-injection-shell-call
(defn run-cmd [c] (sh c "extra" ))
;; ruleid: command-injection-shell-call
(defn run-bash [c] (sh "bash" "-c" c ))
;; ruleid: command-injection-shell-call
(defn run-sh [c] (sh c "o" ))
;; ok: command-injection-shell-call
(defn safe-ls [] (sh "ls" "-la" ))
;; ok: command-injection-shell-call
(defn safe-echo [] (sh "echo" "hi" ))
;; ok: command-injection-shell-call
(defn safe-date [] (sh "date" ))
