(ns dice-roller.core
  (:gen-class)
  (:require [clojure.string :as str]))

(defn roll
  "Roll the dice"
  ([amount sides]
    (map rand-int (repeat amount sides)))
  ([sides]
    (list (rand-int sides))))

(defn parse
  "parse dice to roll from a string"
  [line]
  (map read-string (str/split line #"d")))

(defn -main
  "just some examples for now"
  [& args]
  (println "Hello, World!")
  (println (roll 6 6))
  (println (apply roll (parse "4d6")))
  (println (roll 20)))