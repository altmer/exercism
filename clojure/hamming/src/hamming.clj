(ns hamming)

(defn distance-value
  "Return 0 if given elements are equal, 1 otherwise"
  [a b]
  (if (= a b) 0 1))

(defn distance
  "Returns Hamming distance between given DNA strands"
  [dna-left dna-right]
  (when (= (count dna-left) (count dna-right))
    (reduce + (map distance-value dna-left dna-right))))
