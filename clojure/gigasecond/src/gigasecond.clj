(ns gigasecond
  (:require [clj-time.core :as time]))

(defn from [year month day]
  (let [res (time/plus (time/date-time year month day) (time/seconds 1000000000))]
    [(time/year res) (time/month res) (time/day res)]))
