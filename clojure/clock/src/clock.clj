(ns clock)

(defn num-negative? [num]
 (if (< num 0) 1 0))

(defn add-minutes-to-hours [hours minutes]
 (let [hours-plus-minutes (+ hours (quot minutes 60))]
  (- hours-plus-minutes (num-negative? minutes))))

(defn circular-rem
 [num cycle-size]
 (let [rem-number (rem num cycle-size)]
  (if (< rem-number 0)
   (+ rem-number cycle-size)
   rem-number)))

(defn clock
 "Returns new clock definition"
 [hours minutes]
 {:hour (circular-rem (add-minutes-to-hours hours minutes) 24)
  :minute (circular-rem minutes 60)})

(defn clock->string
 "Returns string representation of given clock"
 [clock]
 (format "%02d:%02d" (:hour clock) (:minute clock)))

(defn add-time [old-clock minutes]
 (clock
  (:hour old-clock)
  (+ minutes (:minute old-clock))))
