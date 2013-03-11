# button.tcl v1
#
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Ouch, that's sharp! button v1 loaded successfully. (454 buttons)"



proc pub_button {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local
        set file "./scripts/buttons.egt"

        set temp_file [open $file "r"]
        set button [split [read -nonewline $temp_file] "\n"]
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	putserv "PRIVMSG $chan :\001ACTION pins a button on $nick, which reads. . . \"[lindex $button [rand [llength $button]]]\"\001"

}

proc pub_other_button {nick mask hand chan arg} {
			upvar #0 recent_output recent_output_local
        set file "./scripts/buttons.egt"
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

        #checking to see if the patron is in channel..
        if {$patron_temp == $patron_local || $patron_local == "NoMatchesFound"} {
                if {$patron_local == "NoMatchesFound"} {
			putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here."
			return
                }
        }


        set temp_file [open $file "r"]
        set button [split [read -nonewline $temp_file] "\n"]
        close $temp_file    
        foreach line [split [lindex $buttons [rand [llength $buttons]]] ¶] {
		check_recent_output buttons $line
	}
	while {$recent_output_local == 1} {
		foreach line [split [lindex $buttons [rand [llength $buttons]]] ¶] {
			check_recent_output buttons $line
		}
	}
		cycle_recent_output buttons $line   

	set odds [rand 35]
	if {$odds < 27} {
		putserv "PRIVMSG $chan :\001ACTION pins a button on $patron_target, which reads. . . \"$line\" courtesy of $nick.\001"
		return
	}
	if {$odds == 28 || $odds == 29} {
		pick_random_patron $chan
		while {$nick == $patron_local} {
			pick_random_patron $chan
		}
		putserv "PRIVMSG $chan :\001ACTION pins a button on $patron_local instead, which reads. . . \"$line\"\001"
		return
	}
	putserv "PRIVMSG $chan :\001ACTION pins a button on $nick instead, which reads. . . \"$line\"\001"
	return	
}

