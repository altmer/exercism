(ns meetup
  (:require [clj-time.core :as time]))

(def weekdays-to-number {:monday 1 :tuesday 2 :wednesday 3 :thursday 4 :friday 5 :saturday 6 :sunday 7})

(defn weekday [year month day]
  (time/day-of-week (time/date-time year month day)))

(defn month-days [date]
  (range
    (time/day (time/first-day-of-the-month- date))
    (inc (time/day (time/last-day-of-the-month- date)))))

(defn teenth? [num]
  (and (> num 12) (< num 20)))

(defn day-number
  [day-numbers modifier]
  (case modifier
    :teenth (first (filter teenth? day-numbers))
    :first (first day-numbers)
    :last (last day-numbers)
    :second (nth day-numbers 1)
    :third (nth day-numbers 2)
    :fourth (nth day-numbers 3)))

(defn meetup
  "Returns next date for meetup given on its description"
  [month year day-of-week modifier]
  (let [date (time/date-time year month)
        dow-number (get weekdays-to-number day-of-week)
        day-numbers (filter #(= dow-number (weekday year month %)) (month-days date))]
    [year month (day-number day-numbers modifier)]))
