(ns binary-search)

(defn middle
  "returns index of the middle element of vector"
  [vec]
  (let [len (count vec)]
    (dec (+ (quot len 2) (rem len 2)))))

(defn- search-in
  [el vec start end]
  (if (> start end)
    (throw (Exception. "not found"))
    (let [pivot-index (quot (+ start end) 2)
          pivot (nth vec pivot-index)]
      (cond
        (= pivot el) pivot-index
        (> pivot el) (search-in el vec start (dec pivot-index))
        :else (search-in el vec (inc pivot-index) end)))))

(defn search-for
  [el input]
  (search-in el input 0 (dec (count input))))
