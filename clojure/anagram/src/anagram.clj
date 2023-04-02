(ns anagram
  (:require [clojure.string :as str]))

(defn normalized [word]
  (str/join (sort (str/lower-case word)))
)

(defn is-anagram? [target word]
  (and
    (= (normalized target) (normalized word))
    (not= (str/lower-case target) (str/lower-case word)))
)

(defn anagrams-for [target words]
  (filter #(is-anagram? target %) words)
)
