(ns triangle)

(defn triangle? [a b c]
  (and
    (> (+ a b) c)
    (> (+ a c) b)
    (> (+ b c) a)))

(defn equilateral? [a b c]
  (and
    (= a b)
    (= a c)))

(defn isosceles? [a b c]
  (or
    (= a b)
    (= a c)
    (= b c)))

(defn type [a b c]
  (cond
    (not (triangle? a b c)) :illogical
    (equilateral? a b c) :equilateral
    (isosceles? a b c) :isosceles
    :else :scalene))
