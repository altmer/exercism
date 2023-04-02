(ns nucleotide-count)

(def nucleotides #{\A \T \C \G})
(def nucleotides-map {\A 0, \T 0, \C 0, \G 0})

(defn count-nucleotides [count-map nucleotide]
  (assoc count-map nucleotide (inc (get count-map nucleotide))))

(defn nucleotide-counts [input]
  (reduce count-nucleotides nucleotides-map input))

(defn count [nucleotide input]
  (if (contains? nucleotides nucleotide)
    (get (nucleotide-counts input) nucleotide)
    (throw (AssertionError. "Wrong nucleotide"))))
