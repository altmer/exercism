(ns robot-name)

(def letters "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
(def numbers "0123456789")

(defn- random-letter [] (rand-nth letters))
(defn- random-number [] (rand-nth numbers))

(defn- random-name
 "returns new random name"
 []
 (str (random-letter) (random-letter) (random-number) (random-number) (random-number)))

(defn robot [] (atom (random-name)))

(defn robot-name [a-robot] @a-robot)

(defn reset-name [a-robot] (reset! a-robot (random-name)))
