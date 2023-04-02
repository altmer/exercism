(ns perfect-numbers)

(defn factors [n]
  (filter #(zero? (rem n %)) (range 1 n)))

(defn sum-factors [n]
  (reduce + 0 (factors n)))

(defn classify
  [num]
  (if (and (number? num) (> num 0))
    (let [sum (sum-factors num)]
      (cond
        (= sum num) :perfect
        (< sum num) :deficient
        :else :abundant))
    (throw (IllegalArgumentException. "Expected positive number"))))
