#! /usr/bin/env wish
#button .hello -text "Hello, World!" -command { exit }
#pack .hello

source src/dice.tcl

label .dice_label -text "Enter dice:"
entry .dice_input -bg white
button .roll_button -text "roll!" -command {
    set dice [parse [.dice_input get]]
    if {[lindex $dice 0] == 0} {
        set result "Invalid format"
    } else {
        set result [roll {*}$dice]
    }
    .result_label configure -text $result
}
label .result_label

#pack .dice_label .dice_input .result_label .roll_button
grid .dice_label .dice_input .roll_button .result_label
grid columnconfigure . {0 1 2} -weight 1
# grid rowconfigure . {0 1}