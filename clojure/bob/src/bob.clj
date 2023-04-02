(ns bob
  (:require [clojure.string :as str]))

(defn shouting? [message]
  (and
    (= (str/upper-case message) message)
    (not= (str/lower-case message) message)))



(defn response-for [message] ;; <- arglist goes here
  (let [trimmedMessage (str/trim message)]
    (cond
      (= trimmedMessage "") "Fine. Be that way!"
      (shouting? trimmedMessage) "Whoa, chill out!"
      (str/ends-with? trimmedMessage "?") "Sure."
      :else "Whatever.")))
