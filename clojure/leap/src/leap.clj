(ns leap)

(defn divisible-by
  [year number]
  (= 0 (rem year number)))

(defn leap-year?
  [year]  
  (and
    (divisible-by year 4)
    (or
      (not (divisible-by year 100))
      (divisible-by year 400))))
