;;; roll-dice --- Summary

;;; Commentary:

;; This is a simple little dice roller written in Emacs Lisp and exposed as an interactive command.
;; Use it with M-x roll-dice RET
;; Input should be in the usual tabletop RPG format "xdy" where x is the amount of dice to roll, y is the number of sides per die, and d is a literal character 'd'

;;; Code:

(defun get-ints-to-roll (source-string)
  "Parse SOURCE-STRING into a list where the first element is the amount of dice to roll and the second element is the number of sides the dice should have."
  (let ((result (split-string source-string "d")))
    (mapcar 'string-to-int result)))

(defun roll-times (amount sides)
  "Roll AMOUNT number of dice that have SIDES number of sides.  Return a list of ints.  This function is recursive."
  (if (= amount 0)
      nil
    (cons (1+ (random sides)) (roll-times (- amount 1) sides))))

(defun roll-dice ()
  "Roll dice, getting input from the minibuffer."
  (interactive)
  (let ((input-string (read-from-minibuffer "Enter dice to roll: ")))
    (message (concat "Results are: "
                     (string-join (mapcar 'number-to-string
                                          (apply 'roll-times (get-ints-to-roll input-string)))
                                  ", ")))))

(provide 'roll-dice)
;;; roll-dice.el ends here
