# quote_lists.tcl v1
#
# Copyright 2006-2012 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <brendan.k.callahan@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
#
########  ADDITIONAL CREDITS  ######################################
#
# bofh.tcl / phrep_ - irc.quakenet.org
# Dubya 1.0  Check <http://www.unknown.nu/eggdrop/> for updated versions... this file should be quite large by 2004.
# (Some) Movie Quotes 1.1 by JimG: Billy Madison,Blazing Saddles, Blues Brothers, Get shorty, \Full Metal Jacket, Goodfellas, Happy Gilmore, Pulp Fiction, Reservoir Dogs, Scarface, Scream
#
#####################################################################

putlog "Quotes galore!!  quote file loaded. . ."



proc pub_random {nick mask hand chan arg} {
				set odds [rand 22]
				if {$odds == 0} {pub_booze $nick $mask $hand $chan $arg}
				if {$odds == 1} {pub_button $nick $mask $hand $chan $arg}
				if {$odds == 2} {pub_breakfast $nick $mask $hand $chan $arg}
				if {$odds == 3} {pub_dinner $nick $mask $hand $chan $arg}
				if {$odds == 4} {pub_lunch $nick $mask $hand $chan $arg}
				if {$odds == 5} {pub_tea $nick $mask $hand $chan $arg}
				if {$odds == 6} {pub_appetizer $nick $mask $hand $chan $arg}
				if {$odds == 7} {pub_chacha $nick $mask $hand $chan $arg}
				if {$odds == 8} {pub_fortune $nick $mask $hand $chan $arg}
				if {$odds == 9} {pub_music $nick $mask $hand $chan $arg}
				if {$odds == 10} {pub_random_news $nick $mask $hand $chan $arg}
				if {$odds == 11} {pub_random_news_self $nick $mask $hand $chan $arg}
				if {$odds == 12} {pub_patron_quotes $nick $mask $hand $chan $arg}
				if {$odds == 13} {pub_clerks $nick $mask $hand $chan $arg}
				if {$odds == 14} {pub_lazarus $nick $mask $hand $chan $arg}
				if {$odds == 15} {pub_futurama $nick $mask $hand $chan $arg}
				if {$odds == 16} {pub_fg $nick $mask $hand $chan $arg}
				if {$odds == 17} {pub_pinky $nick $mask $hand $chan $arg}
				if {$odds == 18} {pub_texts_from_last_night $nick $mask $hand $chan $arg}
				if {$odds == 19} {pub_unusual $nick $mask $hand $chan $arg}
				if {$odds == 20} {serve_usual $nick $mask $hand $chan $arg}
				if {$odds == 21} {serve_usual_ambig $nick $mask $hand $chan $arg}
			return
}

proc pub_music {nick mask hand chan arg} {
	if {[llength $arg] < 4} {pub_spew $chan jukebox 100 "\001ACTION walks to the end of the bar firing up XMMS and plays '" "'.\001" ""}	
	if {[llength $arg] > 3} {pub_spew $chan jukebox 100 "\001ACTION walks to the end of the bar firing up XMMS and plays '" "'.\001" "[lindex $arg 4]"}
}

proc pub_patron_quotes {nick mask hand chan arg} {
	if {[llength $arg] < 3} {pub_spew $chan patron_quotes 150 "" "" ""}	
	if {[llength $arg] > 2} {pub_spew $chan patron_quotes 150 "" "" "[lindex $arg 2]"}
}

proc pub_lazarus {nick mask hand chan arg} {
	if {[llength $arg] < 3} {pub_spew $chan lazarus 20 "" "" ""}	
	if {[llength $arg] > 2} {pub_spew $chan lazarus 20 "" "" "[lindex $arg 2]"}
}
				
proc pub_chocolate {nick mask hand chan arg} {
  pub_spew $chan chocolate 10 "\001ACTION gives $nick some " ".\001" ""
}

proc pub_fortune {nick mask hand chan arg} {
	pub_spew $chan fortune 15 "\001ACTION gives a fortune to $nick, which reads. . . \"" "\".\001" ""
	}

proc pub_button {nick mask hand chan arg} {
	putlog "Calling pub_button."
	pub_spew $chan buttons 50 "\001ACTION pins a button on $nick, which reads. . . \"" "\"\001" ""
}

proc pub_crystal_ball {nick mask hand chan arg} {
	putquick "PRIVMSG $chan :\001ACTION reaches under the bar and pulls out a beautiful quartz orb.\001"
	pub_spew $chan crystal_ball 15 "An eerie voice emanates from the crystal ball and says, \"" "\"" ""
}

proc pub_useless {nick mask hand chan arg} {
	pub_spew $chan useless 10 "" "" ""
	}

proc pub_chacha {nick mask hand chan arg} {
	pub_spew $chan ChaCha 10 "" "" ""
	}

proc pub_firefly {nick mask hand chan arg} {
	pub_spew $chan firefly 10 "" "" ""
}

proc pub_spaceballs {nick mask hand chan arg} {
	pub_spew $chan spaceballs 10 "" "" ""
}

proc pub_horrible {nick mask hand chan arg} {
	pub_spew $chan horrible 10 "" "" ""
}

proc pub_office {nick mask hand chan arg} {
	pub_spew $chan office 10 "" "" ""
}

proc pub_holmes {nick mask hand chan arg} {
	pub_spew $chan holmes 10 "" "" ""
}

proc pub_ghost {nick mask hand chan arg} {
	pub_spew $chan ghost 10 "" "" ""
}

proc pub_texts_from_last_night {nick mask hand chan arg} {
	pub_spew $chan texts 25 "" "" ""
}

proc pub_amore {nick mask hand chan arg} {
	pub_spew $chan amore 10 "" "" ""
}

proc pub_bofh {nick mask hand chan arg} {
	pub_spew $chan bofh 10 "" "" ""
}

proc pub_breakfastclub {nick mask hand chan arg} {
	pub_spew $chan breakfastclub 10 "" "" ""
}

proc pub_clerks {nick mask hand chan arg} {
	pub_spew $chan clerks 10 "" "" ""
}

proc pub_dubya {nick mask hand chan arg} {
	pub_spew $chan dubya 10 "" "" ""
}

proc pub_fg {nick mask hand chan arg} {
	pub_spew $chan familyguy 10 "" "" ""
}

proc pub_futurama {nick mask hand chan arg} {
	pub_spew $chan futurama 10 "" "" ""
}

proc pub_quayle {nick mask hand chan arg} {
	pub_spew $chan quayle 10 "" "" ""
}

proc pub_kosh {nick mask hand chan arg} {
	pub_spew $chan kosh 10 "" "" ""
}

proc pub_snatch {nick mask hand chan arg} {
	pub_spew $chan snatch 10 "" "" ""
}

proc pub_talladega {nick mask hand chan arg} {
	pub_spew $chan talladega 10 "" "" ""
}

proc pub_baked {nick mask hand chan arg} {
	pub_spew $chan baked 10 "" "" ""
}

proc pub_princess {nick mask hand chan arg} {
	pub_spew $chan princess 10 "" "" ""
}

proc pub_realgenius {nick mask hand chan arg} {
	pub_spew $chan realgenius 10 "" "" ""
}

proc pub_groove {nick mask hand chan arg} {
	pub_spew $chan groove 10 "" "" ""
}

proc pub_babylon5 {nick mask hand chan arg} {
	pub_spew $chan babylon5 10 "" "" ""
}

proc pub_matrix {nick mask hand chan arg} {
	pub_spew $chan matrix 10 "" "" ""
}

proc pub_pinky {nick mask hand chan arg} {
	pub_spew $chan pinky 10 "" "" ""
}

proc pub_shit {nick mask hand chan arg} {
	pub_spew $chan shit 10 "" "" ""
}

proc pub_south {nick mask hand chan arg} {
	pub_spew $chan south 10 "" "" ""
}

proc pub_billy {nick mask hand chan arg} {
	pub_spew $chan billy 10 "" "" ""
}

proc pub_blazing {nick mask hand chan arg} {
	pub_spew $chan blazing 10 "" "" ""
}

proc pub_blues {nick mask hand chan arg} {
	pub_spew $chan blues 10 "" "" ""
}

proc pub_dogs {nick mask hand chan arg} {
	pub_spew $chan dogs 10 "" "" ""
}

proc pub_full {nick mask hand chan arg} {
	pub_spew $chan full 10 "" "" ""
}

proc pub_good {nick mask hand chan arg} {
	pub_spew $chan good 10 "" "" ""
}

proc pub_shorty {nick mask hand chan arg} {
	pub_spew $chan shorty 10 "" "" ""
}

proc pub_happy {nick mask hand chan arg} {
	pub_spew $chan happy 10 "" "" ""
}

proc pub_pulp {nick mask hand chan arg} {
	pub_spew $chan pulp 10 "" "" ""
}

proc pub_scarface {nick mask hand chan arg} {
	pub_spew $chan scarface 10 "" "" ""
}

proc pub_scream {nick mask hand chan arg} {
	pub_spew $chan scream 10 "" "" ""
}

proc pub_snowcrash {nick mask hand chan arg} {
	putlog "arg: $arg"
	pub_spew $chan snowcrash 10 "" "" "[lindex $arg 2]"
}

proc pub_outlaws {nick mask hand chan arg} {
	pub_spew $chan outlaws 10 "" "" ""
}

proc pub_voltaire {nick mask hand chan arg} {
	pub_spew $chan voltaire 15 "" "" ""
}

proc pub_chalkboard {nick mask hand chan arg} {
	pub_spew $chan chalkboard 15 "<Episode " "" ""
}

proc pub_redvsblue {nick mask hand chan arg} {
		pub_spew $chan redvsblue 15 "" "" ""
}

proc pub_texts_number {nick mask hand chan arg} {
		putquick "PRIVMSG $chan:$nick, it's the area code."
		return
}


#################################
##### Specialized responses #####
#################################

proc pub_patron_topic {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local

        upvar #0 random_patron random_patron_local
        pick_random_patron $chan

	# set this to where your data file lives
        set file "./scripts/topic.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set topic_lines [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
		foreach line [split [lindex $topic_lines [rand [llength $topic_lines]]] ¶] {
		check_recent_output topic $line
	}
	while {$recent_output_local == 1} {
		foreach line [split [lindex $topic_lines [rand [llength $topic_lines]]] ¶] {
			check_recent_output topic $line
		}
	}
		cycle_recent_output topic $line  15
	putserv "TOPIC $chan :[subst $line]"	
	return
}

proc pub_quotes_count {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local
  set file "./scripts/patron_quotes.egt"
  set temp_file [open $file "r"]
  set patron_quotes [split [read -nonewline $temp_file] "\n"]
  close $temp_file      
	set count_quote [llength $patron_quotes]
		putserv "PRIVMSG $chan :I currently have $count_quote quotes in my notebook."
}

proc pub_other_button {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local patron patron_local
	putlog "calling pub_other_button"
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
		pub_spew $chan buttons 50 "\001ACTION pins a button on $patron_target, which reads. . . \"" "\" courtesy of $nick.\001" ""
		return
	}
	if {$odds == 28 || $odds == 29} {
		pick_random_patron $chan
		not_bots $patron_local $chan
		while {$nick == $patron_local} {
			pick_random_patron $chan
			not_bots $patron_local $chan
		}
		pub_spew $chan buttons 50 "\001ACTION pins a button on $patron_local instead, which reads. . . \"" "\"\001" ""
		return
	}
	pub_spew $chan buttons 50 "\001ACTION pins a button on $nick instead, which reads. . . \"" "\"\001" ""
	return	
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
		pub_spew $chan fortune 15 "\001ACTION gives a fortune to $patron_target, which reads. . . \"" "\" courtesy of $nick.\001" ""
		return
	}
	if {$odds == 28 || $odds == 29} {
		pick_random_patron $chan
		not_bots $patron_local $chan
		while {$nick == $patron_local} {
			pick_random_patron $chan
			not_bots $patron_local $chan
		}
		pub_spew $chan fortune 15 "\001ACTION gives a fortune to $patron_local instead, which reads. . . \"" ".\"\001" ""
		return
	}
	pub_spew $chan fortune 15 "\001ACTION gives $nick a fortune instead, which reads. . .  \"" ".\"\001" ""
	return	
}

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
