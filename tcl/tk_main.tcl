#! /usr/bin/env wish
#button .hello -text "Hello, World!" -command { exit }
#pack .hello

source src/dice.tcl

frame .c -padx 5 -pady 5

proc doRoll {} {
    set dice [parse [.c.diceInput get]]
    if {[lindex $dice 0] == 0} {
        set result "Invalid format"
    } else {
        set result [roll {*}$dice]
    }
    .c.resultValueLabel configure -text $result
}

label .c.diceLabel -text "Enter dice:"
entry .c.diceInput -bg white
bind .c.diceInput <Return> doRoll

button .c.rollButton -text "roll!" -command doRoll

label .c.resultLabel -text "Result:"
label .c.resultValueLabel

grid .c -column 0 -row 0 -sticky nwes

grid .c.diceLabel -column 0 -row 0 -sticky nwes
grid .c.diceInput -column 1 -row 0 -sticky nwes
grid .c.rollButton -column 1 -row 1 -sticky nwes
grid .c.resultLabel -column 0 -row 2 -sticky news
grid .c.resultValueLabel -column 1 -row 2 -sticky nwes

foreach w [winfo children .c] {grid configure $w -padx 10 -pady 10}