(ns phone-number
 (:require [clojure.string :as str]))

(def bad-number "0000000000")

(defn check-country-code [number]
 (if (str/starts-with? number "1")
  (subs number 1)
  bad-number))

(defn number [input]
 (let [clean-number (str/replace input #"[^\d]" "")
       number-length (count clean-number)]
  (cond
   (or (< number-length 10) (> number-length 11)) bad-number
   (= number-length 10) clean-number
   (= number-length 11) (check-country-code clean-number))))

(defn area-code [input]
 (subs (number input) 0 3))

(defn pretty-print [input]
 (let [num (number input)]
  (str "(" (subs num 0 3) ") " (subs num 3 6) "-" (subs num 6))))
