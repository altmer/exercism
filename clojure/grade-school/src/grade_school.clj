(ns grade-school)

(defn grade
 "Returns students for given grade"
 [db gr]
 (get db gr []))

(defn add
 "Add student with given name to certain grade"
 [db student gr]
 (let [students (grade db gr)]
  (assoc db gr (conj students student))))

(defn sorted
 "Returns db as sorted map"
 [db]
 (reduce-kv #(assoc %1 %2 (sort %3)) (sorted-map) db))
