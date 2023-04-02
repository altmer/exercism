(ns etl
  (:require [clojure.string :as str]))

(defn transform-pair
  [new-db cost words]
  (->>
    words
    (map str/lower-case)
    (reduce #(assoc %1 %2 cost) new-db)))

(defn transform
  "Transform given values from old rules format to the new one"
  [db]
  (reduce-kv transform-pair {} db))
