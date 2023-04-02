(ns scrabble-score
  (:require [clojure.string :as string]))

(defn score-letter [letter]
  (let [up-letter (-> letter
                      (str)
                      (string/upper-case))]
    (cond
      (string/includes? "A, E, I, O, U, L, N, R, S, T" up-letter) 1
      (string/includes? "D, G" up-letter) 2
      (string/includes? "B, C, M, P" up-letter) 3
      (string/includes? "F, H, V, W, Y" up-letter) 4
      (string/includes? "K" up-letter) 5
      (string/includes? "JX" up-letter) 8
      (string/includes? "Q, Z" up-letter) 10)))

(defn score-word [word]
  (->> word
      (seq)
      (map score-letter)
      (reduce +)))
