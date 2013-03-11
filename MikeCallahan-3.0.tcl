# MikeCallahan 3.0
# The script that makes Mike, Mike.
#
# Copyright 2006-2009 by Brendan K Callahan <brendan.k.callahan@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@unbaptisethedead.info>.

##### Useful Items
set bot_version "v3.0 build 421"

# $trigger is used in bindz.tcl and fugly.tcl
set trigger "Mike"

# $user_name is used in webpage.tcl
set user_name "callahan"

if {![info exists menu_item]} {
	set menu_item ""
}
if {![info exists booze_item]} {
	set booze_item ""
}

##### set variables
set bot_name "Mike"
set at_line "absolutely nobody"

putlog "#####  Mike Callahan -- Bartender, Time Traveller & Cigar Lover"
putlog "#####  $bot_version, loaded sucessfully."

##### Global Variables
global name

#####Random Actions#####

if {![info exists word_timer_id]} {
	set word_timer_id [timer 2 word_timer]
}

proc word_timer {} {
	global word_timer_id timer_minutes random_actions channel_name
	set timer_minutes [expr [rand 61] + 60]
	pub_spew #callahans random_actions 20 "\001ACTION " "\001" ""
	pub_spew #Mary'sPlace random_actions 20 "\001ACTION " "\001" ""
}

#####END Random Actions#####

proc pub_wiki {nick mask hand chan arg} {
	putquick "PRIVMSG $chan :Sorry, the wiki is no longer in service.  Please speak up if you would like to start one."
}



proc mode:change {nick uhost hand chan mode target} {
	set odds [rand 1400]
	if {$mode == "+o" && $nick == "X"} {
		if {$odds < 20} {putserv "PRIVMSG $chan :Looks like someone's hacked into X"}
		if {$odds > 19 && $odds < 65} {putserv "PRIVMSG $chan :Well, we know who is X's favorite!"}
		if {$odds > 64 && $odds < 153} {putserv "PRIVMSG $chan :op, op, and awaaaaaayyyyyy!"}
		if {$odds > 152 && $odds < 210} {putserv "PRIVMSG $chan :W did it better."}
		if {$odds > 209 && $odds < 310} {putserv "PRIVMSG $chan :Asks $target if they're ready to settle last month's tab."}
	return
	}
}

proc pub_sahara {nick mask hand chan arg} {
	putquick "PRIVMSG $chan :\001ACTION gets the Sahara for $nick.\001"
	return
}

proc topic:changed {nick mask handle channel topic} {
	upvar #0 recent_output recent_output_local
	set odds [rand 300]
	putlog "Detected Topic Change $odds"




	
	#Do we have a tweet?
	# Disabled by Flaim, 10/22, til there's time to fix it.
	#if {[lindex $topic 0] == "CEPT" } {
		#set cept_msg "Mike, twitter"
		#set counter 0
		#putlog "$topic"
		#while {$counter < [llength $topic]} {
			#putlog "[lindex $topic $counter]"
			#if {[lindex $topic $counter] != "|"} {lappend cept_msg [lindex $topic $counter]}
			#if {[lindex $topic $counter] == "|"} {set counter [llength $topic]}
			#incr counter
		#}
		#pub_twitter $nick $mask $handle $channel $cept_msg
		#if {$recent_output_local != 1} {putserv "PRIVMSG $channel :\001ACTION posts the CEPT to the twitter page, as a courtesy to $nick\001"}			
	#}



	
	##### Special topic keeper
	#putlog $topic
	#if {[lindex $topic 0] != "At" && $nick != "Callahan"} {
	#putlog "Got to here (topic keeper)"
		#set temp_add_on_to_topic "At Last: RIP Etta James"
		#putlog "Topic: $topic  Add-on: $temp_add_on_to_topic"
		#putquick "TOPIC $channel :$topic $temp_add_on_to_topic"
		#return
	#}
		
	
			
	if {$odds < 9} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic, then looks at $nick.\001"
		return
	}
	if {$odds > 9 && $odds < 14} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic, then writes a note to Santa Claus.\001"
		return
	}
	if {$odds > 13 && $odds < 19} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and grumbles.\001"
		return
	}
	if {$odds > 18 && $odds < 27} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and chuckles.\001"
		return
	}
	if {$odds == 27} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and runs to the safety of The Chinese Room.\001"
		return
	}
	if {$odds > 26 && $odds < 34} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and smirks.\001"
		return
	}
	if {$odds > 33 && $odds < 46} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and giggles.\001"
		return
	}
	if {$odds > 45 && $odds < 58} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and rolls his eyes.\001"
		return
	}
	if {$odds > 57 && $odds < 72} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and rolls snake eyes.\001"
		return
	}
	if {$odds > 71 && $odds < 95} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and facepalms.\001"
		return
	}
	if {$odds > 94 && $odds < 117} {
		if {$nick == "Callahan"} {return}
		putquick "PRIVMSG $channel :\001ACTION looks at the topic and holds his breath.\001"
		return
	}
}

proc pub_bless {nick mask hand chan arg} {
	upvar #0 patron patron_local name name_local
	if {[lindex $arg 2] == "me"} {
		putserv "PRIVMSG $chan :\001ACTION serves $nick a God's Blessing.\001"
		return
	}
	if {[lindex $arg 2] == "all" || [lindex $arg 2] == "everyone"} {
		putserv "PRIVMSG $chan :\001ACTION starts building God's Blessings for everyone who wants one.\001"
		return
	}
	name_check [lindex $arg 2] $chan
	if {$name_local == 1 || [lindex $arg 2] == "yourself"} {
		putserv "PRIVMSG $chan :\001ACTION serves himself a God's Blessing, courtesy of $nick.\001"
		return
	}
	patron_match [lindex $arg 2] $chan [string length [lindex $arg 2]]
	if {$patron_local == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :Sorry, I don't see [lindex $arg 2] here."
		return
	}
	if {$patron_local != $nick} {
		putserv "PRIVMSG $chan :\001ACTION serves $patron_local a God's Blessing, courtesy of $nick.\001"
		return
	}		
	if {$patron_local == $nick} {
		putserv "PRIVMSG $chan :\001ACTION serves $nick a God's Blessing.\001"
		return
	}
	return
}

proc pub_re-entry {nick mask hand chan arg} {
	putserv "PRIVMSG $chan :re $nick."
	return
}

proc pub_menu {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local
	if {$menu_item_local == ""} {
		putquick "PRIVMSG $chan :$nick, wouldn't it be wise to pick which type of meal first?"
		return
	}
	if {[lindex $menu_item_local 0] == "a" && [lindex $menu_item_local 1] == "pot" && [lindex $menu_item_local 2] == "of"} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and brings out the Sterling Tea set.\001"
		return
	}
	set odds [rand 200]
	if {$odds >= 0 && $odds <= 3} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local, and quickly makes the tiny hair he notices vanish.\001"
		return
	}
	if {$odds > 3 && $odds < 20} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a parsley garnish.\001"
		return
	}
	if {$odds > 19 && $odds < 35} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds an Arugula garnish.\001"
		return
	}
	if {$odds > 34 && $odds < 51} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a chutney garnish.\001"
		return
	}
	if {$odds > 50 && $odds < 70} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a compote cup of mayo on the side.\001"
		return
	}
	if {$odds > 69 && $odds < 84} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a cup of fry sauce.\001"
		return
	}
	if {$odds > 83 && $odds < 109} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a side of beef.\001"
		return
	}
	if {$odds > 108 && $odds < 125} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a rack of lamb.\001"
		return
	}
	if {$odds > 124} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local.\001"
		return
	}
	return
}

proc pub_faq {nick mask hand chan arg} {
	putserv "PRIVMSG $chan :\001ACTION makes note that the channel FAQ can be found nowhere, since no one wants to host it.\001"
}

proc pub_give {nick mask hand chan arg} {
	upvar #0 xtra_status xtra_status_local binary_smoke binary_smoke_local patron patron_local cig cig_local joint joint_local cigar cigar_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local pronoun_subjective pronoun_subjective_local
##### Trap for fortune
	set arg_temp "[string tolower $arg]"
	if {[lindex $arg_temp 4] == "fortune"} {return}
	if {[lindex $arg_temp 4] == "button"} {return}
	if {[lindex $arg_temp 3] == "beer"} {return}
	if {[lindex $arg_temp 4] == "unusual"} {return}
	if {[lindex $arg_temp 3] == "a" && [lindex $arg_temp 4] == "beer"} {
		set arg "Mike, give a beer to [lindex $arg 2]"
		pub_other_beer $nick $mask $hand $chan $arg
		return
	}

	set counter 3
	set request ""
	set cig 0
	set cigar 0
	set joint 0
	while {$counter < [llength $arg]} {
		lappend request [lindex $arg $counter]
		incr counter
	}

	if {[lindex $arg 4] == "usual" || [lindex $arg 4] == "usual."} {
		return
	}
#### seperate check for 'gimme' since the word count is different.

	if {[lindex $arg 1] == "gimme"} { 
		set request ""
		set counter 2
	        while {$counter < [llength $arg]} {
	                lappend request [lindex $arg $counter]
       	       		incr counter
       		 }


		if {[lindex $arg 4] == "stiff" && [lindex $arg 5] == "drink"} {
			putserv "PRIVMSG $chan :\001ACTION gives $nick a double shot of embalming fluid.\001"
			return
		} 
		if {[lindex $request 1] == "answer" || [lindex $request 1] == "Answer"} {
			if {[lindex $request 5] == "universe" || [lindex $request 5] == "Universe"|| [lindex $request 5] == "universe,"|| [lindex $request 5] == "Universe,"} {
				putquick "PRIVMSG $chan :$nick: 42"
				return
			}
		}
		if {[llength $arg] <= 3} {
			putserv "PRIVMSG $chan :\001ACTION gives $nick absolutely nothing.\001"
			return
		}
		putserv "PRIVMSG $chan :\001ACTION gives $nick $request\001"
	return
	}

	if {[lindex $arg 2] == "me"} {
		if {[lindex $arg 4] == "stiff" && [lindex $arg 5] == "drink"} {
		putserv "PRIVMSG $chan :\001ACTION gives $nick a double shot of embalming fluid.\001"
		return
		} 
		if {[lindex $request 1] == "answer" || [lindex $request 1] == "Answer"} {
			if {[lindex $request 5] == "universe" || [lindex $request 5] == "Universe"|| [lindex $request 5] == "universe,"|| [lindex $request 5] == "Universe,"} {
				putquick "PRIVMSG $chan :$nick: 42"
				return
			}
		}
		if {[llength $arg] <= 3} {
		putserv "PRIVMSG $chan :\001ACTION gives $nick absolutely nothing.\001"
		return
	}
		putserv "PRIVMSG $chan :\001ACTION gives $nick $request\001"
	return
	}
	#set target_length [string length [lindex $arg 2]]
	patron_match [lindex $arg 2] $chan [string length [lindex $arg 2]]
	putlog "[lindex $arg 2] [string length [lindex $arg 2]] $patron_local"
	if {$patron_local == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :\001ACTION tells $nick to try that again.\001"
		return
	}
	if {[llength $arg] <= 3} {
		putserv "PRIVMSG $chan :\001ACTION gives $patron_local absolutely nothing, courtesy of $nick.\001"
		return
	}
	if {[lindex $arg 4] == "stiff" && [lindex $arg 5] == "drink"} {
		putserv "PRIVMSG $chan :\001ACTION gives $patron_local a double shot of embalming fluid.\001"
		return
	} 
##### Check to see if a smokable needs a tailored response.	
	detect_smoke $request
	get_xtra $patron_local "SMOKER" $chan
	convert_smoke $xtra_status_local
	set_gender $patron_local $chan
	putlog "$binary_smoke_local"
	if {[lindex $binary_smoke_local 0] == "0" && $cig_local == 1} {
		putserv "PRIVMSG $chan :$nick, $patron_local is a non-smoker and $pronoun_subjective_local probably wouldn't appreciate it."
		return
	}
	if {[lindex $binary_smoke_local 1] == "0" && $joint_local == 1} {
		putserv "PRIVMSG $chan :$nick, $patron_local doesn't get high and $pronoun_subjective_local probably wouldn't appreciate it."
		return
	}
	if {[lindex $binary_smoke_local 2] == "0" && $cigar_local == 1} {
		putserv "PRIVMSG $chan :$nick, $patron_local doesn't smoke cigars and $pronoun_subjective_local probably would get sick if $pronoun_subjective_local smoked it."
		return
	}
##### End smoke checks

	putserv "PRIVMSG $chan :\001ACTION gives $patron_local $request, courtesy of $nick.\001"
	return
}

proc join:greet {nick host hand chan} {
	##### Thsi can be modded at a later time for something other than for the line, but that's all it is for right now.
	upvar #0 at_line at_line_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local valid_user valid_user_local xtra_status xtra_status_local pronoun_objective pronoun_objective_local pronoun_possesive pronoun_possesive_local
	set_gender $nick $chan
	if {$at_line_local == "absolutely nobody"} {
		check_valid_user $nick $chan
		if {$valid_user_local == "1"} {
			get_xtra $nick HELLO $chan
			if {$xtra_status_local == "ON"} {
				set odds [rand 150]
				set_gender $nick $chan
				if {$odds < 9} {
					get_xtra $nick GREETING $chan
					putserv "PRIVMSG $chan :\001ACTION waves to $nick and $xtra_status_local.\001"
					return
				}
				if {$odds > 8 && $odds < 26} {
					if {[llength [chanlist $chan]] > 55} {
						putserv "PRIVMSG $chan :\001ACTION waves to $nick and seeing the place is fairly full, offers $nick a place to stand.\001"
					}
					if {[llength [chanlist $chan]] < 56 && [llength [chanlist $chan]] > 40} {
						putserv "PRIVMSG $chan :\001ACTION waves to $nick and seeing no booths open, offers $nick a stool at the bar.\001"
						return
					}
					if {[llength [chanlist $chan]] < 41} {
						putserv "PRIVMSG $chan :\001ACTION waves to $nick and offers a seat at a booth.\001"
						return
					}
				}
				if {$odds > 25 && $odds < 30} {
					putserv "PRIVMSG $chan :\001ACTION waves to $nick and tells $pronoun_objective_local to wipe $pronoun_possesive_local feet.\001"
					return
				}
				if {$odds > 29 && $odds < 35} {
					putserv "PRIVMSG $chan :\001ACTION waves to $nick and smiles warmly for $pronoun_objective_local.\001"
					return
				}
				if {$odds > 34 && $odds < 40} {
					putserv "PRIVMSG $chan :\001ACTION waves to $nick and grins wickedly at $pronoun_objective_local.\001"
					return
				}
				if {$odds > 39 && $odds < 50} {
					putserv "PRIVMSG $chan :\001ACTION nods to $nick and polishes the bartop.\001"
					return
				}
				if {$odds > 49 && $odds < 55} {
					putserv "PRIVMSG $chan :\001ACTION glances at $nick and whistles innocently.\001"
					return
				}
				if {$odds > 54 && $odds < 60} {
					putserv "PRIVMSG $chan :\001ACTION waves to $nick and motions to everyone else with his hand 'Shhh'.\001"
					return
				}
				return
				}
			}
	}
	if {$at_line_local != "absolutely nobody"} {
		if {[getuser $hand XTRA USUAL] != ""} {
			putserv "PRIVMSG $chan :\001ACTION waves to $nick and serves $pronoun_objective_local [getuser [nick2hand $nick $chan] XTRA USUAL], and points to $at_line_local at the line.\001"
			return
		}
		
		if {[getuser $hand XTRA USUAL] == ""} {
			putserv "PRIVMSG $chan :\001ACTION waves to $nick and serves $pronoun_objective_local $pronoun_possesive_local usual, and points to $at_line_local at the line.\001"
			return
		}
	return
	}
}

proc quit:clean {nick user@host hand chan reason} {
	upvar #0 at_line at_line_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local
	set_gender $nick $chan
	set odds [rand 510]
	if {$odds < 15} {
		if {[lindex $reason 1] == "Chatzilla"} {
		putserv "PRIVMSG $chan :\001ACTION thanks $nick for the version info, and googles for exploits.\001"
		return
		}
		if {[lindex $reason 2] == "Operation"} {
		putserv "PRIVMSG $chan :\001ACTION sighs, and takes care of the post-op mess.\001"
		return
		}
		if {[lindex $reason 3] == "route"} {
		putserv "PRIVMSG $chan :\001ACTION orders a GPS system for $nick.\001"
		return
		}
		if {[lindex $reason 3] == "pipe"} {
		putserv "PRIVMSG $chan :\001ACTION calls Ye Olde Head Shoppe to order a new pipe for $nick.\001"
		return
		}
		if {[lindex $reason 1] == "\*.split"} {
		putserv "PRIVMSG $chan :\001ACTION waits until the tremors are over, and readjusts the picture behind the bar to level again.\001"
		return
		}
		if {[lindex $reason 0] == "Registered"} {
			set odds2 [rand 197]
			if {$odds2 < 17} {putquick "PRIVMSG $chan :\001ACTION goes over to $nick and puts a button on $pronoun_objective_local that says 'Certified by X.  Or is that certifiable?'.\001";return}
			if {$odds2 > 16 && $odds2 < 34} {putquick "PRIVMSG $chan :\001ACTION goes over to $nick and puts a button on $pronoun_objective_local that says 'Certified by X.  Or is that Xtra'.\001";return}
			if {$odds2 > 33 && $odds2 < 50} {putquick "PRIVMSG $chan :\001ACTION goes over to $nick and puts a button on $pronoun_objective_local that says 'Certified by X.  Or is that -- wait, what was I thinking?'.\001";return}
			if {$odds2 > 49 && $odds2 < 67} {putquick "PRIVMSG $chan :\001ACTION goes over to $nick and puts a button on $pronoun_objective_local that says 'Inspected by #X.  Your satisfaction is our goal.'\001";return}
			if {$odds2 > 66 && $odds2 < 83} {putquick "PRIVMSG $chan :\001ACTION goes over to $nick and puts a button on $pronoun_objective_local that says 'Inspected by #X.'\001";return}
			if {$odds2 > 82 && $odds2 < 100} {putquick "PRIVMSG $chan :\001ACTION goes over to $nick and puts a button on $pronoun_objective_local that says 'Inspected by X.  USDA Choice'.\001";return}
			if {$odds2 > 99} {return}
			return
		}
		if {[lindex $reason 0] == "ping" && [lindex $reason 1] == "timeout"} {
		puthelp "PRIVMSG $chan :\001ACTION watches $nick get sucked into the Wayback Machine.\001"
		return
		}
		if {[lindex $reason 0] == "Ping" && [lindex $reason 1] == "timeout"} {
		puthelp "PRIVMSG $chan :\001ACTION watches $nick get sucked into the Wayback Machine.\001"
		return
		}
		if {[lindex $reason 3] == "peer" || [lindex $reason 5] == "peer"} {
		putquick "PRIVMSG $chan :\001ACTION goes over to $nick's table and cleans up the glasses.\001"
		puthelp "PRIVMSG $chan :Judging by the number of glasses, I'd say it was Connection reset by *beer*"
		return
		}
		if {[lindex $reason 1] == "leaving"} {
		putquick "PRIVMSG $chan :o/~. . .on a jet plane, don't know when $nick'll be back again o/~"
		return
		}
		if {[getuser $hand XTRA USUAL] == ""} {
		putquick "PRIVMSG $chan :\001ACTION goes over to $nick's table and cleans up the glasses.\001"
		return
		}
		if {[getuser $hand XTRA USUAL] != ""} {
		putquick "PRIVMSG $chan :\001ACTION goes over to $nick's table and cleans up the glasses.\001"
		puthelp "PRIVMSG $chan :Judging by the number of glasses here, I'd best order some supplies for [getuser $hand XTRA USUAL]."
		return
		}
	}
	return
}

proc part:clean {nick host hand chan msg} {
	set odds [rand 250]
	if {$odds < 10} {
		putserv "PRIVMSG $chan :\001ACTION goes over to $nick's table and takes the mugs away.\001"
		return
	}
	return
}

proc pub_round {nick mask hand chan arg} {
	putquick "PRIVMSG $chan :\001ACTION serves a round of beverages, courtesy of $nick.\001"
	set odds [rand 100]
	if {$odds < 20} {
		puthelp "PRIVMSG $chan :\001ACTION hands $nick the check and whistles impatiently.\001"
		return
	}
}

proc pub_informal {nick mask hand chan arg} {
	putquick "PRIVMSG $chan :Please, $nick, call me Mike."
}
# end pub_informal

proc pub_version {nick mask hand chan text} {
	upvar #0 bot_version bot_version_local
	putserv "PRIVMSG $chan :\001ACTION is running $bot_version_local\001"
}

proc pub_thanks {nick mask hand chan arg} {
	putserv "PRIVMSG $chan :You're welcome, $nick."
	return
}

proc pub_soapbox {nick mask hand chan arg} {
	upvar #0 at_line at_line_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local
	set_gender $nick $chan
	putserv "PRIVMSG $chan :\001ACTION hands $nick a soapbox to stand on, and listens to $pronoun_objective_local quietly.\001"
}

proc pub_line {nick mask hand chan arg} {
	upvar #0 at_line at_line_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local
	set_gender $nick $chan
	upvar #0 at_line at_line_local
	if {$at_line_local != "absolutely nobody"} {
		putserv "PRIVMSG $chan :\001ACTION gently taps $nick on the shoulder, and points $pronoun_objective_local to $at_line_local already at the line.\001"
		return
	}
	if {$at_line_local == "absolutely nobody"} {
		set at_line_local $nick
		if {[getuser $hand XTRA USUAL] != ""} {
			putlog "DEBUG: serve_usual_other_to_other 96 Gave set USUAL to $nick (stepping to line)"
			putserv "PRIVMSG $chan :\001ACTION serves $nick [getuser [nick2hand $nick $chan] XTRA USUAL] at the line and listens to $pronoun_objective_local quietly.\001"
			return
		}
		if {[getuser $hand XTRA USUAL] == ""} {
			putlog "DEBUG: serve_usual_other_to_other 101 Gave unset USUAL to $nick (stepping to line)"
			putserv "PRIVMSG $chan :\001ACTION serves $nick $pronoun_possesive_local usual at the line and listens quietly.\001"
			return
		}
	return	
	}
return
}

proc pub_crash {nick mask hand chan arg} {

set random_toast_list {
"a gin & chronic"
"a stein of mead"
"a gin & tonic"
"a djinn & tonic"
"a gin & phonic"
"a gin & photonic"
"a gin & platonic"
"a gin & mnemonic"
"a gin & sonic"
"a Seven & 7"
"a Cuba Libre"
"a Chupa Cabra Libre"
"a Tuba Libre"
"a Screaming Orgasm"
"some ice cubes"
"the bar towel"
"the bar trowel"
"the bar dowel"
"a Shirley Temple"
"a Shirley Mosque"
"a Shirley Cathedral"
"a Midori Martini"
"some Angostura bitters"
"some Angostura critters"
"a cinnamon stick"
"some cinnamon sticks"
"an unopened, dusty bottle of Michelob"
"a Bloody Merry"
"a Bloody Mary"
"a shot of Jameson's"
"a Dewar's & Soda"
}

	upvar #0 at_line at_line_local
	upvar #0 random_patron random_patron_local
	set counter 0
	if {$nick != $at_line_local} {
	if {$at_line_local != "absolutely nobody"} {
	while {$counter <= [llength $arg]} {
		if {[lindex $arg $counter] == "crash" || [lindex $arg $counter] == "CRASH" || [lindex $arg $counter] == "\*crash\*" || [lindex $arg $counter] == "\*CRASH\*"} {
			set at_line_local "absolutely nobody"
			pick_random_patron $chan
			set toast "[getuser [nick2hand $random_patron_local $chan] XTRA USUAL]"
			if {$toast == ""} {
			set toast "[lindex $random_toast_list [rand [llength $random_toast_list]]]"
			}
			putserv "PRIVMSG $chan :\001ACTION tosses $toast into the fireplace.\001"
			return
		}
		incr counter
	}
	}
	}
}

proc pub_crash_reset {nick mask hand chan arg} {
	upvar #0 at_line at_line_local
	set at_line_local "absolutely nobody"
	putserv "PRIVMSG $chan :\001ACTION rubs his eyes, and realizes the drugs are kicking in.\001"
}

proc pub_line_persona {nick mask hand chan arg} {
	upvar #0 at_line at_line_local
	putserv "PRIVMSG $chan :\001ACTION tells $nick $at_line_local is at the line.\001"
	return
}

proc pub_time_generator {nick mask hand chan arg} {
	set month 0; set day 0; set hour 0; set minute 0; set second 0; set temp 0
	set months 259200
	set random_time [rand 1000000]
	incr random_time
	set variation [rand 58]
	incr variation; incr variation

	if {$random_time > 259199} {
		set temp [expr {$random_time / $months}]
		set month [lindex [split $temp .] 0]
		set random_time [expr {$random_time - [expr {$month * 259200}]}]
	}

	if {$random_time > 86399} {
		set temp [expr {$random_time / 86400}]
		set day [lindex [split $temp .] 0]
		set random_time [expr {$random_time - [expr {$day * 86400}]}]
	}

	if {$random_time > 3599} {
		set temp [expr {$random_time / 3600}]
		set hour [lindex [split $temp .] 0]
		set random_time [expr {$random_time - [expr {$hour * 3600}]}]
		if {$hour < 10} {set hour "0$hour"}
	}

	if {$random_time > 59} {
		set temp [expr {$random_time / 60}]
		set minute [lindex [split $temp .] 0]
		set random_time [expr {$random_time - [expr {$month * 60}]}]
		if {$minute < 10} {set minute "0$minute"}
	}

	if {$random_time > 0} {
		set second $random_time
		if {$second > 59} {set second [rand 58]; incr second; incr second}
		if {$second < 10} {set second "0$second"}
	}
	
	set month_indicator "months"
	if {$month == 1} {set month_indicator "month"}
	
	set day_indicator "days"
	if {$day == 1} {set day_indicator "day"}
	
	putquick "PRIVMSG $chan :\001ACTION grabs a piece of scratch paper, and mumbles.\001"
	if {$month > 0} {
		puthelp "PRIVMSG $chan :$nick, by my estimates, it will be $month $month_indicator, $day $day_indicator, $hour:$minute:$second, +/- $variation seconds."
		return
	}
	
	if {$day > 0} {
		puthelp "PRIVMSG $chan :$nick, by my estimates, it will be $day $day_indicator, $hour:$minute:$second, +/- $variation seconds."
		return
	}
	
	if {$hour > 0} {
		puthelp "PRIVMSG $chan :$nick, by my estimates, it will be $hour:$minute:$second, +/- $variation seconds."
		return
	}
	
	if {$minute > 0} {
		puthelp "PRIVMSG $chan :$nick, by my estimates, it will be 00:$minute:$second, +/- $variation seconds."
		return
	}
	
	puthelp "PRIVMSG $chan :$nick, by my estimates, it will be 00:00:$second, +/- $variation seconds."
	if {$variation > $second} {
		puthelp "PRIVMSG $chan :$nick, are you sure it didn't happen *before* you asked me?"
		return
	}
}
		

proc pub_hook {nick mask hand chan arg} {
	upvar #0 patron patron_local
	upvar #0 random_patron random_patron_local
	set patron_length 0
	set patron_local [lindex $arg 2]
	upvar #0 at_line at_line_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local
	set odds [rand 30]
	set patron_temp $patron_local

#	testing new code for this, omre streamlined -dg 11/21/08
#
#        if {[string length $patron_temp] > 5} {set patron_length 5}
	##putloglev 1 $chan "patron_length = $patron_length"
#        patron_match $patron_temp $chan $patron_length

# Streamlined even more; patron_match can simply take the length of the $arg passed, no if-then needed now
# bkc 03JUL09
	patron_match $patron_temp $chan [string length $patron_temp]
	if {$patron_local != "NoMatchesFound"} {
		set_gender $patron_local $chan
	}


	set body_part {
	"neck"
	"elbow"
	"ankle"
	"knees"
	}

	#Did someone try to hook Mike himself?
	if {$patron_temp == "callahan" || $patron_temp == "Callahan" || $patron_temp == "mike" || $patron_temp == "Mike" || $patron_temp == "yourself"} {
		putserv "PRIVMSG $chan :How do you expect me to hook myself??"
		putserv "PRIVMSG $chan :\001ACTION gets out the Dreaded Hook from the Vaudeville Show and flips $nick into the Hot Tub!\001"
		return
	}
	#Non-specific hooking
	if {$patron_temp == "someone" || $patron_temp == "somebody" || $patron_temp == "anybody" || $patron_temp == "anyone"} {
		pick_random_patron $chan
		putserv "PRIVMSG $chan :\001ACTION gets out the Dreaded Hook from the Vaudeville Show and flips $random_patron_local into the Hot Tub!\001"
		return
	}
	
	#Did the request match anyone in channel?  If not, say so.  Else hook the target (This covers the case where the request matches the nick exactly)
	if {$patron_temp == $patron_local || $patron_local == "NoMatchesFound"} {
		if {$patron_local == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here."
		return
		}
		putserv "PRIVMSG $chan :\001ACTION gets out the Dreaded Hook from the Vaudeville Show and flips $patron_local into the Hot Tub!\001"
		return
	}
	#Fancy hooking of target
	if {$odds <= 22} {
		putserv "PRIVMSG $chan :\001ACTION gets out the Dreaded Hook from the Vaudeville Show, hooks $patron_local by the [lindex $body_part [rand [llength $body_part]]], and flips $pronoun_objective_local into the Hot Tub!\001"
		return
	 }
	#Hooking of the requestor
	if {$odds >= 23 && $odds <=27} {
		putserv "PRIVMSG $chan :\001ACTION flips $nick into the Hot Tub instead!\001"
		return
	}
	#Plain hooking of target
	if {$odds >27} {
	pick_random_patron $chan
		putserv "PRIVMSG $chan :\001ACTION flips $patron_local into the Hot Tub.\001"
		return
	}

}
##### END of pub_hook

proc pub_shoot {nick mask hand chan arg} {
	upvar #0 patron patron_local
	upvar #0 random_patron random_patron_local
	set patron_length 0
	set patron_local [lindex $arg 2]
	upvar #0 at_line at_line_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local
	
	
	set patron_temp $patron_local
	patron_match $patron_temp $chan [string length $patron_temp]
	
	set body_part {
	"wrist"
	"hips"
	"hair"
	"neck"
	"elbow"
	"ankle"
	"knees"
	}
putlog "$patron_temp $patron_local"
	#Did someone try to shoot Mike himself?
	if {$patron_temp == "callahan" || $patron_temp == "Callahan" || $patron_temp == "mike" || $patron_temp == "Mike" || $patron_temp == "yourself"} {
		putserv "PRIVMSG $chan :Do you expect me to shoot myself???"
		putserv "PRIVMSG $chan :\001ACTION loads $nick into the Human Cannonball Device, and launches them into the folx room\001"
		return
	}
	#Non-specific shooting
	if {$patron_temp == "someone" || $patron_temp == "somebody" || $patron_temp == "anybody" || $patron_temp == "anyone"} {
		pick_random_patron $chan
		putserv "PRIVMSG $chan :\001ACTION looks around, and loads $random_patron_local into the Human Cannonball Device, then launches them into the skylight!\001"
		return
	}
	
	#Did the request match anyone in channel?  If not, say so.  Else shoot the target (This covers the case where the request matches the nick exactly)
	if {$patron_temp == $patron_local || $patron_local == "NoMatchesFound"} {
		if {$patron_local == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here."
		return
		}
		#putserv "PRIVMSG $chan :\001ACTION loads $nick into the HCD, and launches them into the folx room!\001"
		#return
	}
	#Fancy shooting of target
	set_gender $patron_local $chan
	set odds [rand 30]
	if {$odds <= 16} {
		putserv "PRIVMSG $chan :\001ACTION grabs $patron_local by the [lindex $body_part [rand [llength $body_part]]], and loads $pronoun_objective_local into the HCD!\001"
		putserv "PRIVMSG $chan :\001ACTION shoots $patron_local into the Hot Tub!\001"
		return
	 }
	#shooting of the requestor
	if {$odds >= 17 && $odds <=23} {
		putserv "PRIVMSG $chan :\001ACTION loads $nick into the Human Cannonball Device, and launches $pronoun_objective_local into the folx room, instead!\001"
		return
	}
	#Plain hooking of target
	if {$odds >22} {
	pick_random_patron $chan
		putserv "PRIVMSG $chan :\001ACTION loads $patron_local into the Human Cannonball Device (HCD),and fires $pronoun_objective_local into the Hot Tub!\001"
		return
	}

}
##### END of pub_shoot

proc pub_hose {nick mask hand chan arg} {
	upvar #0 patron patron_local
	set patron_length 0
	set patron_local [lindex $arg 2]
	set odds [rand 30]
	set patron_temp $patron_local

	patron_match $patron_temp $chan [string length $patron_temp]

	set bottom_body_part {
	"toes"
	"ankles"
	"shins"
	"knees"
	"thighs"
	}
	set top_body_part {
	"head"
	"lips"
	"chin"
	"neck"
	"torso"
	"crotch"
	}
	#Did someone try to hose Mike himself?
	if {$patron_temp == "callahan" || $patron_temp == "Callahan" || $patron_temp == "mike" || $patron_temp == "Mike" || $patron_temp == "yourself"} {
		putserv "PRIVMSG $chan :You think I'm gonna hose myself??"
		putserv "PRIVMSG $chan :\001ACTION grabs the firehose and sprays $nick from [lindex $top_body_part [rand [llength $top_body_part]]] to [lindex $bottom_body_part [rand [llength $bottom_body_part]]]!\001"
		return
	}
	#Did the request match anyone in channel?  If not, say so.  Else hose the target (This covers the case where the request matches the nick exactly)
	if {$patron_temp == $patron_local || $patron_local == "NoMatchesFound"} {
		if {$patron_local == "NoMatchesFound"} {
		putserv "PRIVMSG $chan :Sorry, I don't see $patron_temp here."
		return
		}
		putserv "PRIVMSG $chan :\001ACTION turns the hose on $patron_local!\001"
		return
	}
	#Fancy hosing of target
	if {$odds <= 22} {
		putserv "PRIVMSG $chan :\001ACTION grabs the firehose and sprays $patron_local from [lindex $top_body_part [rand [llength $top_body_part]]] to [lindex $bottom_body_part [rand [llength $bottom_body_part]]]!\001"
		return
	 }
	#Hosing of the requestor
	if {$odds >= 23 && $odds <=47} {
		putserv "PRIVMSG $chan :\001ACTION turns the hose on $nick instead!\001"
		return
	}
	#Plain hosing of target
	if {$odds >47} {
	pick_random_patron $chan
		putserv "PRIVMSG $chan :\001ACTION turns the hose on $patron_local!\001"
		return
	}

	}
##### END of pub_hose

proc pub_unhandcuff {nick mask hand chan arg} {
	global odds3
	set odds3 [rand 10]
	if {$odds3 >= 0 && $odds3 <= 6} {
		putserv "PRIVMSG $chan :\001ACTION tosses $nick the handcuff keys.\001"
		return
	}
	if {$odds3 == 7} {
		putserv "PRIVMSG $chan :No way, Jose!"
	}
	if {$odds3 == 8} {
		putserv "PRIVMSG $chan :What are you gonna do for me, $nick ?"
	}
	if {$odds3 == 9} {
		putserv "PRIVMSG $chan :\001ACTION hides the keys.\001",
	}
}

proc pub_hug {nick mask hand chan text} {
	putserv "PRIVMSG $chan :\001ACTION hugs $nick.\001"
}

proc pub_re {nick mask hand chan text} {
	putserv "PRIVMSG $chan : re $nick."
}

proc pub_spill {} {
	upvar #0 drink_nick drink_nick_local drink_channel drink_channel_local
	putserv "PRIVMSG $drink_channel_local :\001ACTION hurries over to $drink_nick_local table with a new drink, and adds the cost of a drink to Momo's tab.\001"
	return
}


proc act:action_event {nick mask hand chan keyword arg} {
	upvar #0 name name_local
	upvar #0 at_line at_line_local
	upvar #0 random_patron random_patron_local drink_nick drink_nick_local drink_channel drink_channel_local
	set counter 0
	name_check $arg $chan
	
	##### Check if Momo is doing something Mike needs to help with.
	
	if {$nick == "MomoPuppy"} {
		putlog "Momo: $arg"
		### Check if Momo needs let out to go to the bathroom
		if {[lindex $arg 2] == "whining" && [lindex $arg 3] == "noises"} {
			putserv "PRIVMSG $chan :\001ACTION runs over to the pantry door and lets Momo out.\001"
			return
		}
		if {[lindex $arg 0] == "puts" && [lindex $arg 1] == "the"} {
			putserv "PRIVMSG $chan :\001ACTION runs over to the back door and lets Momo out.\001"
			return
		}
		
		##### Check if Momo knocked over someone's drink  --> MomoPuppy runs about chasing the Kong, knocking over AuntieEm's drink.
		if {[lindex $arg 5] == "knocking" && [lindex $arg 4] == "Kong,"} {
			set drink_nick_local [lindex $arg 7]
			set drink_channel_local $chan
			set spill_timer_id [utimer [expr [rand 10] + 10] pub_spill]
			return
		}		
		
		##### Check if Momo is playing with something invisible runs around the room
		putlog "Next: [lindex $arg 1]"
		if {[lindex $arg 0] == "runs" && [lindex $arg 1] == "around" && [lindex $arg 2] == "the" && [lindex $arg 3] == "room"} {
			set odds [rand 100]
			putlog "INVIS: $odds"
			if {$odds == 0} {
				putserv "PRIVMSG $chan :\001ACTION tosses a Milk Bone to Momo.\001"
				return
		}
			if {$odds == 1 || $odds == 2 || $odds == 3} {
				putserv "PRIVMSG $chan :\001ACTION tries to distract Momo with a rope toy.\001"
				return
		}
			if {$odds > 3 && $odds < 8} {
				putserv "PRIVMSG $chan :\001ACTION tries to distract Momo with Late Night Puppy Kung Fu®.\001"
				return
		}
			if {$odds > 7 && $odds < 15} {
				putserv "PRIVMSG $chan :\001ACTION tries to distract Momo with a squeaky toy.\001"
				return
		}
			if {$odds > 14 && $odds < 25} {
				putserv "PRIVMSG $chan :\001ACTION tosses a Beggin' Strip to Momo.\001"
				return
		}
			if {$odds > 24 && $odds < 33} {
				putserv "PRIVMSG $chan :\001ACTION tries to distract Momo with a Kong filled with frozen peanut butter.\001"
				return
		}
			if {$odds > 32 && $odds < 41} {
				putserv "PRIVMSG $chan :\001ACTION tosses a bit of bagel to Momo.\001"
				return
		}
			if {$odds > 40 && $odds < 44} {
				putserv "PRIVMSG $chan :\001ACTION tries to distract Momo with a bag of Sour Diesel.\001"
				return
		}
			return
		}
		
		### Next function for Momo
	}
	
	# check to see if Mike is in the arg.
	if {[lindex $arg 1] == "to" || [lindex $arg 2] == "to" || [lindex $arg 3] == "to" || [lindex $arg 4] == "to" || [lindex $arg 2] == "to" || [lindex $arg 6] == "to" || [lindex $arg 7] == "to" || [lindex $arg 8] == "to"} {
		if {[lindex $arg 2] == "the" || [lindex $arg 3] == "the" || [lindex $arg 4] == "the" || [lindex $arg 5] == "the" || [lindex $arg 6] == "the" || [lindex $arg 7] == "the" || [lindex $arg 8] == "the" || [lindex $arg 9] == "the"} {
			if {[lindex $arg 3] == "line" || [lindex $arg 4] == "line" || [lindex $arg 5] == "line" || [lindex $arg 6] == "line" || [lindex $arg 7] == "line" || [lindex $arg 8] == "line" || [lindex $arg 9] == "line" || [lindex $arg 10] == "line"} {
			pub_line $nick $mask $hand $chan $arg
			}
		}
	}

	if {$nick != $at_line_local} {
	if {$at_line_local != "absolutely nobody"} {
	while {$counter <= [llength $arg]} {
		if {[lindex $arg $counter] == "crash" || [lindex $arg $counter] == "CRASH" || [lindex $arg $counter] == "Crash"} {
			pub_crash $nick $mask $hand $chan $arg
			pick_random_patron $chan
			set toast "[getuser [nick2hand $random_patron_local $chan] XTRA USUAL]"
			putserv "PRIVMSG $chan :\001ACTION tosses $toast into the fireplace.\001"
			return
		}
		incr counter
	}
	}
	}

	if {[lindex $arg 0] == "yawns" || [lindex $arg 0] == "yawns."} {
		pub_bed_yawn $nick $mask $hand $chan $arg
		return
	}
	
	# took out the debugging putlog.  it worked. 07jun
	# took rest of function out 11FEB08 bkc
	# thought to make a note saying I took the comments out for the non-existant function.  Realized absurdity of that kind of remark. 14FEB2008 bkc
	
	##### Adding response to away messages 14FEB2008 bkc
	
	set month {
	"JAN"
	"FEB"
	"MAR"
	"APR"
	"MAY"
	"JUN"
	"JUL"
	"AUG"
	"SEP"
	"OCT"
	"NOV"
	"DEC"
}

	if {[lindex $arg 0] == "is" && [lindex $arg 1] == "away:"} {
		set odds [rand 500]
		if {$odds >= 0 && $odds <= 43} {
			putserv "PRIVMSG $chan :\001ACTION hangs a sign on $nick with 'Do Not Disturb until [expr [rand 27] + 1][lindex $month [rand [llength $month]]][expr [rand 15] + 2014]' on it.\001"
			return
		}
		if {$odds >= 44 && $odds <= 112} {
			putserv "PRIVMSG $chan :\001ACTION hangs a sign on $nick with 'Do Not Disturb' on it.\001"
			return
		}
		if {$odds >= 113 && $odds <= 148} {
			putserv "PRIVMSG $chan :\001ACTION covers $nick with a blanket.\001"
			return
		}
		if {$odds >= 149 && $odds <= 201} {
			putserv "PRIVMSG $chan :\001ACTION moves $nick's marker on the board from 'In' to 'Out'.\001"
			return
		}
		if {$odds >= 201 && $odds <= 252} {
			putserv "PRIVMSG $chan :\001ACTION puts $nick into suspended animation.\001"
			return
		}
		if {$odds >= 282 && $odds <= 299} {
			putserv "PRIVMSG $chan :\001ACTION gets out some dark glasses, and neuralizes $nick.\001"
			puthelp "PRIVMSG $chan :You did not see that flash of light which did not erase your memory."
			puthelp "PRIVMSG $chan :\001ACTION puts the dark glasses away, and goes back to polishing the bartop.\001"
			return
		}
		return
}
##### Adding response to back messages 14FEB2008 bkc

if {[lindex $arg 0] == "is" && [lindex $arg 1] == "back"} {
		set odds [rand 500]
		if {$odds >= 0 && $odds <= 43} {
			putserv "PRIVMSG $chan :\001ACTION hands $nick a 'While you were away' notepaper.\001"
			return
		}
		if {$odds >= 44 && $odds <= 112} {
			putserv "PRIVMSG $chan :\001ACTION hands $nick a stack of 'While you were away' notepapers.\001"
			return
		}
		if {$odds >= 113 && $odds <= 200} {
			putserv "PRIVMSG $chan :\001ACTION zaps $nick back out of suspended animation.\001"
			return
		}
		if {$odds >= 201 && $odds <= 230} {
			putserv "PRIVMSG $chan :\001ACTION moves $nick's marker on the board from 'Out' to 'In'.\001"
			return
		}
		if {$odds >= 231 && $odds <= 281} {
			putserv "PRIVMSG $chan :\001ACTION moves $nick's marker on the board from 'Out' to 'In'(sane).\001"
			return
		}
		if {$odds >= 282 && $odds <= 299} {
			putserv "PRIVMSG $chan :\001ACTION cheers the return of $nick.\001"
			return
		}
		return
}
}
# proc_name_check moved to fugly

proc pub_long {nick mask hand chan arg} {
	global odds3
	set odds3 [rand 150]
	upvar #0 random_patron random_patron_local
	pick_random_patron $chan
	while {$random_patron_local == $nick} {
			pick_random_patron $chan
		}
	if {$odds3 >= 0 && $odds3 <= 14} {
		putserv "PRIVMSG $chan :\001ACTION runs over to the next county.\001"
		return
	}
	if {$odds3 >= 15 && $odds3 <= 37} {
		putserv "PRIVMSG $chan :\001ACTION runs a buttonhook, and starts waving to $nick.\001"
		return
	}
	if {$odds3 >= 38 && $odds3 <= 57} {
		putserv "PRIVMSG $chan :\001ACTION runs a screen pattern, and knocking motions to $nick.\001"
		return
	}
	if {$odds3 >= 58 && $odds3 <= 74} {
		putserv "PRIVMSG $chan :\001ACTION runs down field, and watches as $nick gets sacked by $random_patron_local.\001"
		return
	}
	if {$odds3 >= 75 && $odds3 <= 92} {
		putserv "PRIVMSG $chan :\001ACTION runs down field, and watches as $random_patron_local gets called for Offsides.\001"
		return
	}
	if {$odds3 >= 93 && $odds3 <= 118} {
		putserv "PRIVMSG $chan :\001ACTION runs down field, and watches as $random_patron_local gets called for a Personal Foul.\001"
		return
	}
	if {$odds3 >= 119 && $odds3 <= 136} {
		putserv "PRIVMSG $chan :\001ACTION runs down field, and watches as $random_patron_local makes an interception.\001"
		return
	}
		
	if {$odds3 >= 137} {
		putserv "PRIVMSG $chan :\001ACTION runs down field, drops the ball, and starts asking the ref to call interference on $random_patron_local.\001"
		return
	}
	return
}

#Password resetting
proc pub_reset_pass {nick mask hand arg} {
	set chan "#callahans"
	if {![matchattr [nick2hand $nick] +Q]} {
		#####If not a bot op, have Mike msg all bot ops on that a user wants a password reset.
		foreach bot_op [chanlist $chan +Q] {
			putserv "NOTICE $bot_op :Password reset requested by $nick ($mask)"
			putserv "NOTICE $bot_op :If you know this to be the correct person, please issue the following command:"
			putserv "NOTICE $bot_op :'  /msg Callahan reset_pass $hand  ' (I'd just C&P that myself if I were you)"
			putserv "NOTICE $bot_op :Once someone has done this you will be notified, so as to not reset it more than once."
		}
		##### Notify requester		
		putserv "PRIVMSG $nick :Ops have been notified of your request.  Once they have approved your request, you will be messaged with your temporary password by me."
		return
	}

	if [matchattr [nick2hand $nick] +Q] {
		#####If a bot op, reset the target's password, and /msg them the new one.
		set target_hand [lindex $arg 3]
		putlog "DEBUG: arg: $arg | target_hand: $target_hand"
		set target_nick $target_hand
		putlog "DEBUG: target_nick: $target_nick"
		set temp_pass [expr [rand 90000] + 10000]
		putlog "DEBUG: temp_pass: $temp_pass"
		foreach bot_op [chanlist $chan +Q] {
			if {$bot_op != $nick} {
				putserv "NOTICE $bot_op :Password reset requested by $target_nick ($target_hand) completed by $nick"
			}
			if {$bot_op == $nick} {
				putserv "NOTICE $bot_op :You have sucessfully reset $target_nick's ($target_hand) password."
			}
		}
		setuser $target_hand PASS $temp_pass
		putserv "PRIVMSG $target_nick :*****Thank you for your patience.*****"
		putserv "PRIVMSG $target_nick :An op has fufilled your password reset request.  Your temporary password is '$temp_pass'."
		putserv "PRIVMSG $target_nick :To change your temporary password, issue the following command:"
		putserv "PRIVMSG $target_nick :'/msg Callahan PASS $temp_pass <newpass>'"
		putserv "PRIVMSG $target_nick :If that doesn't work, try telling Mike who you are:"
		putserv "PRIVMSG $target_nick :'/msg Callahan IDENT $temp_pass' then try the first command again."
		return
	}
	return
}

proc priv_MSGOP {nick mask hand arg} {
	set chan "#callahans"
	foreach bot_op [chanlist $chan +Q] {
		putserv "PRIVMSG $bot_op :<$nick> $arg."
	}
	return
}
