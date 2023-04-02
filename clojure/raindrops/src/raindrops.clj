(ns raindrops)

(defn word [number literal divisor]
  (if (= 0 (rem number divisor))
    literal
    ""))

(defn plingplangplong [number]
  (str (word number "Pling" 3) (word number "Plang" 5) (word number "Plong" 7)))

(defn convert
  [number]   
  (let [res (plingplangplong number)]
    (if (= res "")
      (str number)
      res)))
