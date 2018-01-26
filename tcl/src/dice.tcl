# dice.tcl
# holds procs related to the rolling of dice

proc roll {amount sides} {
    puts "rolling a $amount\d$sides"
    variable result {}
    for {set i 0} {$i < $amount} {incr i} {
        lappend result [expr {int($sides*rand())+1}]
    }
    return $result
}

proc parse {line} {
    set retval [regexp {^(\d*)d(\d+)$} $line -> amount sides]
    if {$retval == 0} {
        return {0 0}
    }
    if {$amount == ""} {
        set amount "1"
    }
    return [list $amount $sides]
}