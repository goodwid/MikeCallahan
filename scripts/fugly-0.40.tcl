##### Eggdrop functions.tcl
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
##### a global, all-purpose tcl functions for eggdrop bots
##### For bug reports or any other communication, please write to FUGLY@3whack.org and use "FUGLY" as the subject.

putlog "#####  Friendly Uniform Global LibrarY (FUGLY)  v.40 build 006 loaded."

##### Global varibles that fugly will use, that you will reference by "«variable»_local".  Be sure to refernce via a "upvar #0 «variable» «varaible»_local" statement.  Also, make sure they are not already used by your script anywhere.

global patron random_patron name botname_position

##### This checks to see if a patron is in channel.  You need to pass the nick you want to check for presence, the channel name, and how many digits you want for close matching.  If you set $digits to a negative number, it will do exact matching (case-insensitive).  If you pass "4" it will check for the first nick that matches the first 4 chars of each, and change $patron to that nick.  Again, you'll want to use "upvar #0 patron patron_local" to access its results.

proc patron_match {patron_local_temp channel_local digits} {
upvar #0 patron patron_local
	set patron_local ""
        foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
        }
##### Check for funky nicks that don't start with normal characters, that ppl might not type, i.e., let someone type "foobar" if the nick is "^foobar^"
	set foo "^"
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
        }
	set patron_local_temp [string trimleft $patron_local_temp "_"]
	set foo "-"
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
	}
	set patron_local_temp [string trimleft $patron_local_temp "-"]
	set foo "\["
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
	}
	set patron_local_temp [string trimleft $patron_local_temp "\["]
	set foo "\]"
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
	}
	set patron_local_temp [string trimleft $patron_local_temp "\]"]
	set foo "\{"
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
	}
	set patron_local_temp [string trimleft $patron_local_temp "\{"]
	set foo "\}"
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
	}
	set patron_local_temp [string trimleft $patron_local_temp "\}"]
	set foo "|"
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
	}
	set patron_local_temp [string trimleft $patron_local_temp "|"]
	set foo "`"
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
	}
	set patron_local_temp [string trimleft $patron_local_temp "`"]
	set foo "V_"
	append foo $patron_local_temp
	set patron_local_temp $foo
	foreach check_list [chanlist $channel_local] {
	 if {[string equal -nocase -length $digits $check_list $patron_local_temp]} {
			set patron_local $check_list
			return
                }
##### End of funky initial nick character check

        }
	# if no match found, return that value
	set patron_local "NoMatchesFound"
	return
}
	
	
	#####Check if nick matches to a valid user in user dbase.  Pass the nick to check (target) and the channel (chan).  Use valid_user_local to retrieve results.
	
proc check_valid_user {target chan} {
		upvar #0 valid_user valid_user_local
	if {[validuser [nick2hand $target $chan]] == 1} {
		set valid_user_local 1
		return
	}
	if {[validuser [nick2hand $target $chan]] == 0} {
		set valid_user_local 0
		return
	}
}
	
##### Picks a random patron from $chan which you must pass	Use $random_patron for result, bv using upvar,  Will check to make sure not in a list of known bots.  Insert your own bots in not_bots you wish to not be picked randomly, such as channel services and such.

proc pick_random_patron {chan} {
	upvar #0 random_patron random_patron_local
	set random_patron_local [lindex [chanlist $chan] [rand [llength [chanlist $chan]]]]
	not_bots $random_patron_local $chan
	return
}


##### Checks to make sure any patron is not X or the bot itself.  Meant to be called by pick_random_patron, as it will keep picking patrons recursively, until one is not.

proc not_bots {patron chan} {
	upvar #0 random_patron random_patron_local
	if {$random_patron_local ==  "X" || $random_patron_local == "Mike" || $random_patron_local == "Callahan" || $random_patron_local == "MaryFinn" || $random_patron_local == "Tom_Hauptmann" || $random_patron_local == "Wurlitzer" || $random_patron_local == "PixelCat"} {
		pick_random_patron $chan
		return
	}
}

#####Procedure to check if Botname matches.  Pass $arg that you want to check.   $name == 1 if true, 0 if false. References $name at global level via call-by-reference variable $name_local.  This does the work of checking if someone is talking to the bot or not.  Returns botname_position, reference via "upvar #0 botname_position botname_position_local"

proc name_check {arg chan} {
	global bot_name_list counter counter2 botname_position botname_position_local
	upvar #0 name name_local
	upvar #0 botname_position botname_position_local
	set botname_position_local 0
	set counter 0
	while {$counter < [llength $arg]} {
		if {[lindex $arg $counter] == "Mike" || [lindex $arg $counter] == "mike"} {
			set name_local 1
			set botname_position_local $counter
			set counter [llength $arg]
			return
			}
	incr counter
	}
	set name_local 0
	return
}

##### Procedure to retrieve and set a variable to the XTRA for usage.  Must pass the targets's nick ($target), the XTRA field you're checking ($xtra) and the channel ($chan).  Sets $xtra_status to the value (You must check if it's a valid value), or "0" if it does not exist.  Remember to upvar #0 xtra_status.

proc get_xtra {target xtra chan} {
	upvar #0 xtra_status xtra_status_local
	set xtra_status_local "[getuser [nick2hand $target $chan] XTRA $xtra]"
	if {$xtra_status_local == ""} {
		set $xtra_status_local 0
		setuser [nick2hand $target $chan] XTRA 0
		return
		putlog "$xtra_status_local from get_xtra"
	}
	return
}

proc set_xtra {target xtra xtra_value chan} {
	get_xtra $target $xtra $chan
	setuser [nick2hand $target $chan] XTRA $xtra
	putlog "Set $target's XTRA $xtra to $xtra_value"
	return
}


##### Converts the XTRA SMOKE value (passed as xtra) to a binary representation

proc convert_smoke {xtra} {
	upvar #0 binary_smoke binary_smoke_local
	set binary_smoke_local ""
	set cig 0
	set joint 0
	set cigar 0
	if {$xtra > 3} {set cig 1}
	if {$xtra == 2 || $xtra == 3 || $xtra == 6 || $xtra == 7} {set joint 1}
	if {$xtra == 1 || $xtra == 3 || $xtra == 5 || $xtra == 7} {set cigar 1}
	lappend binary_smoke_local $cig
	lappend binary_smoke_local $joint
	lappend binary_smoke_local $cigar
	return
}

##### Checks for any smokable item.  Takes $request which is the arg to search for the smokable. Will set $cig, $cigar or $joint if items are found, to true "1"; sets to false "0" by defualt.

proc detect_smoke {request} {
	set counter 0
	upvar #0 cig cig_local cigar cigar_local joint joint_local
	set cig_local 0
	set cigar_local 0
	set joint_local 0
	while {$counter < [llength $request]} {
		if {[lindex $request $counter] == "cig" || [lindex $request $counter] == "cigarette" || [lindex $request $counter] == "smoke" || [lindex $request $counter] == "faggot"} {
			set cig_local 1
			putlog "Detected cigarette"
		}
		if {[lindex $request $counter] == "cigar"} {
			set cigar_local 1
			putlog "Detected cigar"
		}
		if {[lindex $request $counter] == "joint" || [lindex $request $counter] == "hashish" || [lindex $request $counter] == "marijuana" || [lindex $request $counter] == "Columbian" || [lindex $request $counter] == "spliff" || [lindex $request $counter] == "dime" || [lindex $request $counter] == "bud" || [lindex $request $counter] == "bhong" || [lindex $request $counter] == "bong"} {
			set joint_local 1
			putlog "Detected 420"
		}
		incr counter
	}
}

proc set_gender {nick chan} {
	upvar #0 pronoun_possesive pronoun_possesive_local xtra_status xtra_status_local pronoun_objective pronoun_objective_local pronoun_subjective pronoun_subjective_local
	get_xtra $nick "GENDER" $chan
		set pronoun_possesive_local "their"
		set pronoun_objective_local "them"
		set pronoun_subjective_local "they"
	if {$xtra_status_local == "M"} {
		set pronoun_possesive_local "his"
		set pronoun_objective_local "him"
		set pronoun_subjective_local "he"
	}
	if {$xtra_status_local == "F"} {
		set pronoun_possesive_local "her"
		set pronoun_objective_local "her"
		set pronoun_subjective_local "she"
	}
	if {$xtra_status_local == "A" || $xtra_status_local == "0"} {
		set pronoun_possesive_local "their"
		set pronoun_objective_local "them"
		set pronoun_subjective_local "they"
	}
	return
}