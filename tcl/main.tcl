#!/usr/bin/env tclsh

proc roll {amount sides} {
    puts -nonewline "\["
    for {set i 0} {$i < $amount} {incr i} {
        puts -nonewline "[expr {int($sides*rand())+1}]"
        if {$i < [expr {$amount-1}]} {
            puts -nonewline ", "
        }
    }
    puts "]"    
}

roll 4 100
roll 40 20