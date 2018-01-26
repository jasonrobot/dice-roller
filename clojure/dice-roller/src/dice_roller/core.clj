(ns dice-roller.core
  (:gen-class)
  (:require [clojure.string :as str]))

(defn add-one
  [num]
  (+ 1 num))

(defn roll
  "Roll the dice"
  ([amount sides]
    (map add-one (map rand-int (repeat amount sides))))
  ([sides]
    (list (add-one (rand-int sides)))))

(defn parse
  "parse dice to roll from a string"
  [line]
  (map read-string (str/split line #"d")))

(defn main-loop
  "loop on user input"
  []
  (print "=> ")
  (flush)
  (let [line (read-line)]
    (cond
      (= line "q") nil
      :else (do 
              (println (apply roll (parse line)))
              (recur)))))

(defn -main
  "prints welcome and starts the loop"
  [& args]
  (println "Welcome!")
  (main-loop))