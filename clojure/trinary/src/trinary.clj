(ns trinary)

(defn position-value [pos-char pos-number] 
    (* (Math/pow 3 pos-number) (- (int pos-char) (int \0))))

(defn convert [[head & tail] pos]
  (let [pos-val (position-value head pos)]
    (if (empty? tail)
      pos-val
      (+ pos-val
         (convert tail (inc pos))))))

(defn to-decimal [trinary-number]
  (if (re-matches #"[012]+" trinary-number)
    (int (convert (reverse (seq trinary-number)) 0))
    0))
