# unusual.tcl v1
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "What the hell is that?   Unusual v1 loaded successfully."




proc pub_unusual {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local
        set file "./scripts/unusual.egt"

        set temp_file [open $file "r"]
        set unusual [split [read -nonewline $temp_file] "\n"]
        close $temp_file      
				
				foreach line [split [lindex $unusual [rand [llength $unusual]]] ¶] {
		check_recent_output unusual $line
	}
	while {$recent_output_local == 1} {
		foreach line [split [lindex $unusual [rand [llength $unusual]]] ¶] {
			check_recent_output unusual $line
		}
	}
		cycle_recent_output unusual $line 

	putserv "PRIVMSG $chan :\001ACTION rummages around under the bar and hands $nick $line.\001"

}

proc pub_other_unusual {nick mask hand chan arg} {
		upvar #0 recent_output recent_output_local
        set file "./scripts/unusual.egt"
	upvar #0 patron patron_local
	set patron_local [lindex $arg 2]
	set patron_temp $patron_local
	
	if {[string length $patron_temp] <= 5} {
		#This is where we pass the patron  & channel that is requested to be hosed to FUGLY, and the length we're using for a "match"
		set patron_length "[string length $patron_temp]"
		patron_match $patron_temp $chan $patron_length
	}

	if {[string length $patron_temp] > 5} {
		#This is where we pass the patron  & channel that is requested to be hosed to FUGLY, and the length we're using for a "match"
		patron_match $patron_temp $chan 5
	}
	set patron_target $patron_local
        set temp_file [open $file "r"]
        set unusual [split [read -nonewline $temp_file] "\n"]
        close $temp_file      
        
        foreach line [split [lindex $unusual [rand [llength $unusual]]] ¶] {
		check_recent_output unusual $line
	}
	while {$recent_output_local == 1} {
		foreach line [split [lindex $unusual [rand [llength $unusual]]] ¶] {
			check_recent_output unusual $line
		}
	}
		cycle_recent_output unusual $line 
        
	pick_random_patron $chan
	set odds [rand 10]
	if {$odds < 4} {
		putserv "PRIVMSG $chan :\001ACTION rummages around under the bar and hands $patron_target $line, courtesy of $nick\001"
		return
	}
	
	if {$odds == 4} {
		putserv "PRIVMSG $chan :\001ACTION rummages around under the bar, turns pale briefly then rummages around some more and hands $patron_target $line, courtesy of $nick\001"
		return
	}
	
	if {$odds == 5 || $odds == 6} {
		putserv "PRIVMSG $chan :\001ACTION rummages around under the bar, giggles and rummages around some more and hands $patron_target $line, courtesy of $nick\001"
		return
	}
	
	if {$odds == 7 || $odds == 8} {
		putserv "PRIVMSG $chan :\001ACTION rummages around under $patron_local's seat and hands $patron_target $line, courtesy of $nick\001"
		return
	}
	
	if {$odds == 9} {
		putserv "PRIVMSG $chan :Sorry $nick, we're fresh out!"
		return
	}

}
