#!/usr/bin/env tclsh

source src/dice.tcl

set line ""

puts "Welcome!"
while 1 {
    puts -nonewline "Enter dice (q to quit): "
    flush stdout
    gets stdin line
    if {$line == {q}} {
        break
    }
    set dice [parse $line]
    if {[lindex $dice 0] == 0} {
        puts "Invalid format"
    } else {
        set result [roll {*}$dice]
    }
    puts "\[$result\]"
}
