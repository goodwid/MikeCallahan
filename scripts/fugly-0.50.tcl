##### Eggdrop functions.tcl
#
# Copyright 2006-2009 by David Goodwin <goodwid@gmail.com> , Brendan K Callahan <brendan.k.callahan@gmail.com> and William S. Buehl <wsbuehl@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
##### a global, all-purpose tcl functions for eggdrop bots
##### For bug reports or any other communication, please write to FUGLY@3whack.org and use "FUGLY" as the subject.

putlog "#####  Friendly Uniform Global LibrarY (FUGLY)  v0.50 build 040 loaded."

##### Global varibles that fugly will use, that you will reference by "«variable»_local".  Be sure to refernce via a "upvar #0 «variable» «varaible»_local" statement.  Also, make sure they are not already used by your script anywhere.

global patron random_patron name botname_position recent_output


##### This checks to see if a patron is in channel.  You need to pass the nick you want to check for presence, the channel name, and how many digits you want for close matching.  If you set $digits to a negative number, it will do exact matching (case-insensitive).  If you pass "4" it will check for the first nick that matches the first 4 chars of each, and change $patron to that nick. Note that the number of digits should refer to only alphanumeric digits, the 'funky' characters will be removed first.  Again, you'll want to use "upvar #0 patron patron_local" to access its results.

proc patron_match {patron_temp chan digits} {
upvar #0 patron patron_local xtra_status xtra_status_local
 	##### Check for all nicks as an exact match for the specified length in case people include a nicks funky characters.
    foreach check_list [chanlist $chan] {
		if {[string equal -nocase -length $digits $check_list $patron_temp]} {
			set patron_local $check_list
			return
        }
    }
	##### Check for all nicks no matter what funky characters, that ppl might not type, i.e., let someone type "foobar" if the nick is "^foobar^". Do this by removing all the funky chars from the nick.
	foreach check_list [chanlist $chan] {
		set check_list_temp [regsub -all V_|\\^|-|_|\{|\}|\\\[|\]|\\||\\\\|` $check_list ""]
		if {[string equal -nocase -length $digits $check_list_temp $patron_temp]} {
			set patron_local $check_list
			return
        }
    }
	##### Check for a match to the "Familiar" name that people may have saved in their XTRA info
	set familiar "FAMILIAR"
    foreach check_list [chanlist $chan] {
    	if {[validuser [nick2hand $check_list $chan]]} { 
	       	get_xtra $check_list $familiar $chan
        	if {$xtra_status_local != ""} {
	       		if {[string equal -nocase -length $digits $patron_temp $xtra_status_local]} {
				set patron_local $check_list
				return
               	}
        	}
        }
	}        	
	# if no match found, return that value
    set patron_local "NoMatchesFound"
}
	
	#####Check if nick matches to a valid user in user dbase.  Pass the nick to check (target) and the channel (chan).  Use valid_user_local to retrieve results. Since this is already a boolean function, we can simply set our variable to it's output.  WSB-8-2009
	
proc check_valid_user {target chan} {
	upvar #0 valid_user valid_user_local
	set valid_user_local [validuser [nick2hand $target $chan]]
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

#####Procedure to check if Botname matches.  Pass $arg that you want to check.   $name == 1 if true, 0 if false. References $name at global level via call-by-reference variable $name_local.  Note that this requires the existance of the global variable '$trigger', which is currently set in bindz.tcl. (WSB 8-2009) This does the work of checking if someone is talking to the bot or not.  Returns botname_position, reference via "upvar #0 botname_position botname_position_local"

proc name_check {arg chan} {
	global bot_name_list counter counter2 botname_position botname_position_local
	upvar #0 name name_local
	upvar #0 botname_position botname_position_local trigger trigger_local
	set botname_position_local 0
	set counter 0
	set trigger_local_lower [string tolower $trigger_local]
	while {$counter < [llength $arg]} {
		if {[lindex $arg $counter] == $trigger_local || [lindex $arg $counter] == $trigger_local_lower} {
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
	setuser [nick2hand $target $chan] XTRA $xtra $xtra_value
	putlog "Set $target's XTRA $xtra to $xtra_value in set_xtra (fugly)"
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

##### Make up for the craptastic eggdrop RNG
proc pub_spew {chan keyword rgt_size spew_special_start spew_special_end search_term} {
	#Set variable to local for recursive need.
	upvar #0 recent_output recent_output_local spew_buffer spew_buffer_local
	
	#Open the file, read it into spew_buffer_temp, close file
	set file "./scripts/$keyword.egt"
	set temp_file [open $file "r"]
	set spew_buffer_temp [split [read -nonewline $temp_file] "\n"]
	set spew_buffer_local_temp ""
	close $temp_file    
  
	#Pick a random line, and set spew_buffer_local to its value
	set spew_buffer_local [lindex $spew_buffer_temp [rand [llength $spew_buffer_temp]]]
	putlog "Search Term == $search_term"
	
	if {$search_term == ""} {
		check_recent_output $keyword $spew_buffer_local	
		while {$recent_output_local == 1} {
			set spew_buffer_local [lindex $spew_buffer_temp [rand [llength $spew_buffer_temp]]]
			check_recent_output $keyword $spew_buffer_local 
		}
	}
	
	if {$search_term != ""} {
		set counter 0
		while {$counter < [llength $spew_buffer_temp]} {
			set temp_lower_case [lindex $spew_buffer_temp $counter]
			set temp_lower_case [string tolower $temp_lower_case]
			set temp_search_term [string tolower $search_term]
			if {[string first $temp_search_term $temp_lower_case] != -1} {lappend spew_buffer_local_temp [lindex $spew_buffer_temp $counter]}
			incr counter
			}
		if {[llength $spew_buffer_local_temp] == 0} {
			putquick "PRIVMSG $chan :I'm sorry, but I couldn't find $search_term in the $keyword file."
			return
			}
		set spew_buffer_local [lindex $spew_buffer_local_temp [rand [llength $spew_buffer_local_temp]]]
		}
	

	
	#Now that we've found a non-recent line, add it to the FIFO file.
	cycle_recent_output $keyword $spew_buffer_local	$rgt_size
	# Now we can spew it into channel, seperating individual lines.
	foreach line [split [lindex $spew_buffer_local] ¶] {
		putquick "PRIVMSG $chan :$spew_special_start$line$spew_special_end"
		}
}


##### Checking if a list item has been recently used

proc check_recent_output {target_file target_phrase} {
		upvar #0 recent_output recent_output_local
		set recent_output_local ""
		set counter 0
		set file "./scripts/$target_file.rgt"
		putlog "Reading $target_file.rgt in check_recent_output"
		set temp_file [open $file "r"]
    set target_temp [split [read -nonewline $temp_file] "\n"]
    close $temp_file
    while {$counter < [llength $target_temp]} {
    	if {$target_phrase == [lindex $target_temp $counter]} {
    		set recent_output_local 1
    		return
    	}
    	if {$target_phrase != [lindex $target_temp $counter]} {
    		set recent_output_local 0
    		incr counter
    	}
    }
	return	
}

##### adding a list item that has been recently used

proc cycle_recent_output {target_file target_phrase rgt_size} {
		set counter 1
		set temp_write ""
		#Read file
		set file "./scripts/$target_file.rgt"
		set temp_file [open $file "r"]
    set target_temp [split [read -nonewline $temp_file] "\n"]
    close $temp_file
    #Add new one to list (Making total of rgt_size + 1)
    lappend target_temp $target_phrase
    
    #Write file back
    set file_name "./scripts/$target_file.rgt"
    set temp_file [open $file_name "w"]
    while {$counter <= $rgt_size} {
			puts $temp_file [lindex $target_temp $counter]
			incr counter
		}
		flush $temp_file
		close $temp_file    
	return
}

proc get_recent_output {target_file rgt_index} {
		upvar #0 rgt_output rgt_output_local
		set file "./scripts/$target_file.rgt"
		set temp_file [open $file "r"]
    set target_temp [split [read -nonewline $temp_file] "\n"]
    close $temp_file
    set rgt_output_local [lindex $target_temp $rgt_index]
    if {$rgt_output_local == ""} {set rgt_output_local "absolute and all-encompassing nothingness"}
    	
    set counter 0
    while {$counter < 10} {
    	if {$counter != $rgt_index} {lappend write_temp [lindex $target_temp $counter]}
    	if {$counter == $rgt_index} {lappend write_temp ""}
    	incr counter
    }
    set temp_file [open $file "w"]
    set counter 0
   	while {$counter <= [llength $write_temp]} {
			puts $temp_file [lindex $write_temp $counter]
			incr counter
		}
		flush $temp_file
		close $temp_file
    return
 }
 
proc put_recent_input {target_file rgt_index store_item nick chan} {
	upvar #0 filled filled_local
	set filled_local 0
    set file "./scripts/$target_file.rgt"
		set temp_file [open $file "r"]
    set target_temp [split [read -nonewline $temp_file] "\n"]
    close $temp_file
    
    if {[lindex $target_temp $rgt_index] != ""} {
    	set filled_local 1
    	putserv "PRIVMSG $nick :I'm sorry, bin $rgt_index already has [lindex $target_temp $rgt_index] in it.  Please empty this slot first."
    	return
    }
    set counter 0
    while {$counter < 11} {
    	if {$counter != $rgt_index} {lappend write_temp [lindex $target_temp $counter]}
    	if {$counter == $rgt_index} {lappend write_temp $store_item}
    	incr counter
    }
    set temp_file [open $file "w"]
    set counter 0
   	while {$counter <= [llength $write_temp]} {
			puts $temp_file [lindex $write_temp $counter]
			incr counter
		}
		flush $temp_file
		close $temp_file
    return
    	
}

proc list_recent_input {target_file nick} {
		set file "./scripts/$target_file.rgt"
		set temp_file [open $file "r"]
    set target_temp [split [read -nonewline $temp_file] "\n"]
    close $temp_file
    set counter 0
    foreach line $target_temp {
		putquick "PRIVMSG $nick :Bin: $counter Contents: $line"
		incr counter
		}
		return
}
