# fortune.tcl v1
#
#
# Copyright 2006-2009 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "4198 cookies opened, fortune v1 loaded successfully."

proc pub_bed {nick mask hand chan arg} {
	set odds [rand 100]
	set bed_action {
	"a cot"
	"a coupon for a Motel 8"
	"a tent built for three (5 if you're well aquainted)"
	"some Nytol"
	"a bed"
	}
	set bed_spoken {
	"Not sleeping much lately"
	"Getting the 7 year itch"
	"We have a cot in the storage room"
	}
	if {$odds < 20} {
		putserv "PRIVMSG $chan :\001ACTION gives $nick [lindex $bed_action [rand [llength $bed_action]]].\001"
		return
	}
	if {$odds > 19  && $odds < 40} {
		putserv "PRIVMSG $chan :[lindex $bed_spoken [rand [llength $bed_spoken]]], $nick?"
		return
	}
}

proc pub_bed_yawn {nick mask hand chan arg} {
	set odds [rand 100]
	set bed_action {
	"a cot"
	"a coupon for a Motel 8"
	"a tent built for three (5 if you're well aquainted)"
	"some Nytol"
	"a bed"
	}
	if {$odds < 30} {
		putserv "PRIVMSG $chan :\001ACTION gives $nick [lindex $bed_action [rand [llength $bed_action]]].\001"
		return
	}
}

proc pub_other_fortune {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local patron patron_local
	set patron_local [lindex $arg 2]
	set patron_temp $patron_local
	set patron_length 5
	if {[string length $patron_temp] < 5} {set patron_length "[string length $patron_temp]"}
	patron_match $patron_temp $chan $patron_length
	set patron_target $patron_local
	if {$patron_temp == $patron_local || $patron_local == "NoMatchesFound"} {
		if {$patron_local == "NoMatchesFound"} {
			putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here."
	    return
		}
	}	
	set odds [rand 35]
	if {$odds < 27} {
		pub_spew $chan fortune 15 "\001ACTION gives a fortune to $patron_target, which reads. . . \"" "\" courtesy of $nick.\001"
		return
	}
	if {$odds == 28 || $odds == 29} {
		pick_random_patron $chan
		while {$nick == $patron_local} {
			pick_random_patron $chan
		}
		pub_spew $chan fortune 15 "\001ACTION gives a fortune to $patron_local instead, which reads. . . \"" "\".\001"
		return
	}
	pub_spew $chan fortune 15 "\001ACTION gives $nick a fortune instead, which reads. . .  \"" "\".\001"
	return	
}

