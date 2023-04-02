(ns sublist)

(defn list-contains? [super sub]
  (some #(= % sub) (partition (count sub) 1 super)))

(defn classify [left right]
  (cond
    (= left right) :equal
    (list-contains? left right) :superlist
    (list-contains? right left) :sublist
    :else :unequal))
