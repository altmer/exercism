(ns grains)

(defn square [num]
  (if (<= num 1)
    1
    (*' 2 (square (dec num)))))

(defn total []
  (reduce + (map square (range 1 65))))
