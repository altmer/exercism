(ns rna-transcription)

(defn convert-nucleotide [nucleotide]
  (case nucleotide
    \G "C"
    \C "G"
    \T "A"
    \A "U"
    (throw (AssertionError. "Wrong nucleotide"))))

(defn to-rna [dna-strand]
  (apply str (map convert-nucleotide dna-strand)))
