(ns word-count
  (:require [clojure.string :as str]))

(defn put-word [count-map word]
  (assoc count-map word (inc (get count-map word 0))))

(defn word-count [phrase]
  (reduce put-word {} (re-seq #"\w+" (str/lower-case phrase))))
