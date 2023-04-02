(ns roman-numerals)

(def numerals-representation
  {1000 "M" 900 "CM" 500 "D" 400 "CD" 100 "C"
    90 "XC"  50 "L" 40 "XL" 10 "X" 9 "IX" 5 "V"
    4 "IV" 1 "I"})

(def num-list '(1000 900 500 400 100 90 50 40 10 9 5 4 1))

(defn construct-roman [number numbers-list]
  (if (empty? numbers-list)
     ""
     (let [current-divider (first numbers-list)
           q (quot number current-divider)
           r (rem number current-divider)]
       (str
         (apply str (repeat q (get numerals-representation current-divider)))
         (construct-roman r (rest numbers-list))))))

(defn numerals [num]
  (construct-roman num num-list))
