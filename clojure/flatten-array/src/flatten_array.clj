(ns flatten-array)

(declare flatten)

(defn flatten-each
  [array]
  (reduce (fn [acc elem] (concat acc (flatten-array/flatten elem))) [] array))

(defn flatten
  "flattens nested sequence"
  [input]
  (cond
    (coll? input) (flatten-each input)
    (nil? input) []
    :else [input]))
