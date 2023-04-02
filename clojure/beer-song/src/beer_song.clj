(ns beer-song
  (:require [clojure.string :as str]))

(defn ending [n]
  (if (= n 1)
    ""
    "s")
)

(defn verse [n]
  (cond
    (> n 1) (str n " bottles of beer on the wall, " n " bottles of beer.\n"
                 "Take one down and pass it around, " (dec n) " bottle" (ending (dec n)) " of beer on the wall.\n")
    (= n 1) (str "1 bottle of beer on the wall, 1 bottle of beer.\n"
                 "Take it down and pass it around, no more bottles of beer on the wall.\n")
    (= n 0) (str "No more bottles of beer on the wall, no more bottles of beer.\n"
                 "Go to the store and buy some more, 99 bottles of beer on the wall.\n"))
)

(defn sing
  ([from-verse] (sing from-verse 0))
  ([from-verse to-verse]
    (str/join
      "\n"
      (map verse
           (range from-verse (dec to-verse) -1)))
  )
)
