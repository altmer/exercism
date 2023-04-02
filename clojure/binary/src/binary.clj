(ns binary)

(defn position-value [pos-char pos-number]
  (if (= pos-char \1)
    (* (Math/pow 2 pos-number))
    0))

(defn convert [[head & tail] pos]
  (let [pos-val (position-value head pos)]
    (if (empty? tail)
      pos-val
      (+ pos-val
         (convert tail (inc pos))))))

(defn to-decimal [binary-number]
  (if (re-matches #"[01]+" binary-number)
    (int (convert (reverse (seq binary-number)) 0))
    0))
