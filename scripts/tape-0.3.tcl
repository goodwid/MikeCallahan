#
# Copyright 2006-2008 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <brendan.k.callahan@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

set tapee ""

proc pub_tape {nick mask hand chan arg} {
	upvar #0 valid_user valid_user_local
	upvar #0 patron patron_local
	upvar #0 tapee tapee_local
	upvar #0 color1 color1_local
	upvar #0 color2 color2_local
	upvar #0 furniture_object furniture_object_local
	upvar #0 tape tape_local
	set tapee_local ""
	set patron_length 0
	set patron_local [lindex $arg 2]
	set odds [rand 26]
	set patron_length [string length $patron_local]
	
	patron_match $patron_local $chan $patron_length
	set target $patron_local
	
	set color {
	"red"
	"orange"
	"yellow"
	"green"
	"blue"
	"purple"
	"pink"
	"fuschia"
	"chartreuse"
	"coral"
	"puce"
	"lavender"
	"black"
	"white"
	"translucent"
	"transparent"
	"silver"
	"gold"
	"copper"
	"platinum"
	"sea green"
	"lime green"
	"navy blue"
	"rust"
	"lemon yellow"
	"glow-in-the-dark"
	"ochre"
	"sepia"
	"mauve"
	}
	
	set furniture {
	"the hot tub"
	"the bartop"
	"a table"
	"the piano"
	"the underside of a table"
	"the fireplace mantle"
	"a barstool"
	"the mirror"
	"the stage"
	"the trapdoor in the ceiling"
	"the dartboard"
	"the front door"
	"the phone booth"
	"the stock room door"
	"a keg of Bushmill's"
	}
	
	set tape {
	"duct"
	"masking"
	"Scotch Brand"
	"packing"
	"strapping"
	"paper"
	"POLICE LINE - DO NOT CROSS"
	"double-sided"
	"gauze"
	"athletic"
	"magnetic"
	}
	
	set color1_local [lindex $color [rand [llength $color]]]
	set color2_local [lindex $color [rand [llength $color]]]
	# Check to make sure we're not using the same colors, and keep picking until we aren't.
	while {$color1_local == $color2_local} {
		set color2_local [lindex $color [rand [llength $color]]]
	}
	
	set tape_local [lindex $tape [rand [llength $tape]]]
	set furniture_object_local [lindex $furniture [rand [llength $furniture]]]
	set taped-fields "TAPED"
	putlog "Set fields in tape.tcl"
	
	#TRYING TO TAPE MIKE
	if {$target == "callahan" || $target == "Callahan" || $target == "mike" || $target == "Mike" || $target == "yourself" || $target == "yourself." || $target == "yourself!" || $target == "yourself,"} {
		putlog "Someone tried to tape Mike"
		putserv "PRIVMSG $chan :You think I'm gonna tape myself??"
		tape_them_filter $nick $chan
		return
	}
	# End of taping Mike
	
	
	#TAPING YOURSELF
	if {[lindex $arg 2] == "me"} {
		putlog "Someone tried to tape themselves"
		putserv "PRIVMSG $chan :\001ACTION looks at $patron_local oddly.\001"
		tape_them_filter $nick $chan
		return
	}
	if {$target == $nick} {
		putlog "Someone tried to tape themselves"
		putserv "PRIVMSG $chan :\001ACTION looks at $patron_local oddly.\001"
		tape_them_filter $nick $chan
		return
	}
	#End of taping yourself
	
	
	#Did the request match anyone in channel?  If not, say so.  Else tape the target (This covers the case where the request matches the nick exactly)

		if {$target == "NoMatchesFound"} {
			putlog "Target not found.  Reacquiring. . ."
			set target $nick
			putserv "PRIVMSG $chan :\001ACTION grabs the $color1_local & $color2_local roll of $tape_local tape and tapes $target to $furniture_object_local instead, since the other one isn't here.\001"
			return
			putlog "Someone tried to tape someone not here"
			putserv "PRIVMSG $chan :Sorry, I don't see $target here."
			tape_them_filter $nick $chan
			return
		}
	tape_them_filter $target $chan
	return
}

proc tape_them_filter {target chan} {
	upvar #0 valid_user valid_user_local
	upvar #0 xtra_status xtra_status_local
	check_valid_user $target $chan
	if {$valid_user_local == 0} {
		putlog "Not Valid User"
		tape_them $target $chan
		return
	}
	get_xtra $target TAPED $chan
	set already_taped $xtra_status_local
	putlog "already_taped == '$already_taped'"
	if {$valid_user_local == 1 && $already_taped < 1} {
		putlog "Valid user, not taped"
		tape_them $target $chan
		set_tape_status 1 $target $chan
		set_untape_timer $target $chan
		return
	}
	if {$valid_user_local == 1 && $already_taped == 1} {
		putlog "Valid user, already taped"
		untape $target $chan
		tape_them $target $chan
		set_tape_status 1 $target $chan
		set_untape_timer $target $chan
		return
	}
}

proc set_tape_status {status target chan} {
	putlog "Set tape status to $status for $target in $chan."
	set_xtra $target TAPED $status $chan
	get_xtra $target TAPED $chan
	putlog "Verifying tape status as $status for $target in $chan."
	return
}

proc untape {target chan} {
	upvar #0 valid_user valid_user_local
	upvar #0 xtra_status xtra_status_local
	upvar #0 pronoun_objective pronoun_objective_local
	check_valid_user $target $chan
	get_xtra $target TAPED $chan
	if {$valid_user_local == 1 && $xtra_status_local == 1} {
		putlog "Untaped $target in $chan."
		set_gender $target $chan
		putserv "PRIVMSG $chan :\001ACTION looks at $target, and untapes $pronoun_objective_local.\001"
		set_tape_status 0 $target $chan
	return
	}
	return
}

proc set_untape_timer {target chan} {
	upvar #0 untape_timer_id untape_timer_id_local
	set untape_timer [expr [rand 15] + 3]
	putlog "Set untape_timer to $untape_timer minutes."
	if {![info exists untape_timer_id]} {
		putlog "Setting timer fields"
		set untape_timer_id_local "[timer $untape_timer untape_timer] $target $chan"
		putlog "$untape_timer_id_local"
		putlog "Done"
	}
	return
}

proc untape_timer {} {
		upvar #0 untape_timer_id untape_timer_id_local
		upvar #0 xtra_status xtra_status_local
		upvar #0 pronoun_objective pronoun_objective_local
		putlog "DEBUG: proc untape_timer"
		putlog "Untape Timer: $untape_timer_id_local"
		set target [lindex $untape_timer_id_local 1]
		set chan [lindex $untape_timer_id_local 2]
		get_xtra $target TAPED $chan
		if {$xtra_status_local == 0} {
			putlog "User already untaped, exiting"
			return}
		if {$xtra_status_local == 1} {
		putlog "Untape timer went off, untaping $target in $chan"
		set_tape_status 0 $target $chan
		set_gender $target $chan
		putserv "PRIVMSG $chan :\001ACTION looks at $target, and untapes $pronoun_objective_local.\001"
		return
		}
		return
	}
	
proc tape_them {target chan} {
	upvar #0 color1 color1_local
	upvar #0 color2 color2_local
	upvar #0 furniture_object furniture_object_local
	upvar #0 tape tape_local
	set odds [rand 27]
	putlog "Taping $target"
	if {$odds <= 24} {
	 putserv "PRIVMSG $chan :\001ACTION grabs the $color1_local & $color2_local roll of $tape_local tape and tapes $target to $furniture_object_local.\001"
	return
	}	
	if {$odds >= 25} {
		putserv "PRIVMSG $chan :\001ACTION grabs the Official Red & Green roll of duct tape and tapes $target to the bar!\001"
		return
	}
	putlog "Your CASE logic is failing"
	return
}
#### END of pub_tape
