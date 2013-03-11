# MikeCallahan 2.0
# The script that makes Mike, Mike.
#
# Copyright 2006-2008 by Brendan K Callahan <brendan.k.callahan@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

##### Useful Items
set bot_version "v2.0 build 004 (release)"
putlog "#####  Mike Callahan -- Bartender, Time Traveller & Cigar Lover"
putlog "#####  $bot_version, loaded sucessfully."

##### Global Variables
global name

#####Random Actions#####

set timer_minutes [expr [rand 35] + 35]
set timer_minutes2 [expr [rand 15] + 5]
set channel_name "#callahans"
set channel_name2 "#Mary\'sPlace"


###Random non-interactive actions###
if {![info exists word_timer_id]} {
	set word_timer_id [timer $timer_minutes word_timer]
}

###Random non-interactive actions###
if {![info exists word_timer_id2]} {
	set word_timer_id2 [timer $timer_minutes2 word_timer2]
}

proc word_timer {} {
	global word_timer_id timer_minutes random_actions channel_name
	set word_timer_id [timer $timer_minutes word_timer]
	putserv "PRIVMSG $channel_name :\001ACTION [lindex $random_actions [rand [llength $random_actions]]]\001"
	set timer_minutes [expr [rand 30] + 20]
}

proc word_timer2 {} {
	global word_timer_id2 timer_minutes2 random_actions channel_name2
	set word_timer_id [timer $timer_minutes word_timer]
	putserv "PRIVMSG $channel_name :\001ACTION [lindex $random_actions [rand [llength $random_actions]]]\001"
	set timer_minutes2 [expr [rand 30] + 20]
}


##### Regular Triggers#####
bind pubm - *Thanks~again,~Mike* pub_thanks
bind pubm - *Mike,~choco* pub_chocolate
bind pubm - *Mike,~hug* pub_hug
bind pubm - *Mike,~keys* pub_unhandcuff
bind pubm - *Mike,~will* pub_yoda_ball
bind pubm - *Mike,~would* pub_yoda_ball
bind pubm - *Mike,~should* pub_yoda_ball
bind pubm - *Mike,~shall* pub_yoda_ball
bind pubm - *Mike,~could* pub_yoda_ball
bind pubm - *Mike,~can* pub_yoda_ball
bind pubm - *Mike,~may* pub_yoda_ball
bind pubm - *Mike,~is* pub_yoda_ball
bind pubm - *Mike,~are* pub_yoda_ball
bind pubm - *Mike,~hose* pub_hose
bind pubm - *Mike,~hook* pub_hook
bind pubm - *Mike,~tape* pub_tape
bind pubm - *Mike,~who~* give_tagline
bind pubm - *Mike,~soapbox* pub_soapbox
bind pubm - *Mike,~help* pub_help
bind pubm - *Mike,~when* pub_time_generator
bind pubm - *Mike,~how~long* pub_time_generator
bind pubm - *Mike,~round* pub_round
bind pubm - *crash* pub_crash
bind pubm - *Mike,~reset* pub_crash_reset
bind pubm - *Mike,~who's~at~the~line* pub_line_persona
bind pubm - Callahan,~* pub_informal
bind pubm - *Mike,~give* pub_give
#bind pubm - *Mike,~gimme* pub_give
bind pubm - *Mike,~get* pub_give
bind pubm - *Mike,~rules pub_faq
bind pubm - *Mike,~faq pub_faq
bind pubm - *Mike,~I'll~have~some* pub_menu
bind pubm - *Mike,~I'll~take~some* pub_menu
bind pubm - *Mike,~I'll~take~one* pub_menu
bind pubm - *Mike,~I'll~have~one* pub_menu
bind pubm - *Mike,~I'll~ahve~some* pub_menu
bind pubm - *Mike,~I'll~ahve~one* pub_menu
bind pubm - *Mike,~bless* pub_bless
bind pubm - *re,~Mike pub_re-entry
bind pubm - *re~Mike pub_re-entry
bind pubm - *Mike,~desert* pub_sahara
bind pubm - *Mike,~version* pub_version
bind pubm - *Mike,~go~long* pub_long

bind CTCP - action act:action_event
bind join - * join:greet
bind sign - * quit:clean
bind part - * part:clean
bind topc - * topic:changed
bind mode - * mode:change

##### set variables
set bot_name "Mike"
set at_line "absolutely nobody"
set menu_item ""







proc mode:change {nick uhost hand chan mode target} {
	set odds [rand 2000]
	if {$mode == "+o" && $nick == "X"} {
		if {$odds < 28} {putserv "PRIVMSG $chan :Looks like someone's hacked into X"}
		if {$odds > 27 && $odds < 85} {putserv "PRIVMSG $chan :Well, we know who is X's favorite!"}
		if {$odds > 84 && $odds < 103} {putserv "PRIVMSG $chan :op, op, and awaaaaaayyyyyy!"}
	return
	}
}

proc pub_sahara {nick mask hand chan arg} {
	putquick "PRIVMSG $channel :\001ACTION gets the Sahara for $nick.\001"
	return
}

proc topic:changed {nick user@host handle channel topic} {
	set odds [rand 100]
	putlog "Detected Topic Change $odds"
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
}

proc pub_bless {nick mask hand chan arg} {
	upvar #0 patron patron_local
	if {[lindex $arg 2] == "me"} {
		putserv "PRIVMSG $chan :\001ACTION serves $nick a God's Blessing.\001"
		return
	}

	if {[llength [lindex $arg 2]] > 4} {
		patron_match [lindex $arg 2] $chan 5
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

	if {[llength [lindex $arg 2]] < 5} {
		patron_match [lindex $arg 2] $chan [string length [lindex $arg 2]]
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
	set odds [rand 150]
	if {$odds == 0} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local, and quickly makes the tiny hair vanish.\001"
		return
	}
	if {$odds > 0 && $odds < 20} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a parsley garnish.\001"
		return
	}
	if {$odds > 19 && $odds < 25} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a parsely garnish.\001"
		return
	}
	if {$odds > 24 && $odds < 31} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a chutney garnish.\001"
		return
	}
	if {$odds > 30 && $odds < 40} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a compote cup of mayo on the side.\001"
		return
	}
	if {$odds > 39 && $odds < 44} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local and adds a cup of fry sauce.\001"
		return
	}
	if {$odds > 43} {
		putquick "PRIVMSG $chan :\001ACTION serves $nick $menu_item_local.\001"
		return
	}
	return
}

proc pub_faq {nick mask hand chan arg} {
	putserv "PRIVMSG $chan :\001ACTION makes note that the channel FAQ can be found at http://3whack.org/mike/viewtopic.php?t=56\001"
}

proc pub_give {nick mask hand chan arg} {
	upvar #0 xtra_status xtra_status_local binary_smoke binary_smoke_local patron patron_local cig cig_local joint joint_local cigar cigar_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local pronoun_subjective pronoun_subjective_local
##### Trap for fortune
	if {[lindex $arg 4] == "fortune"} {return}
	if {[lindex $arg 4] == "button"} {return}

	set counter 3
	set request ""
	set cig 0
	set cigar 0
	set joint 0
	while {$counter < [llength $arg]} {
		lappend request [lindex $arg $counter]
		incr counter
	}
	putlog "request == $request from pub_give"

	if {[lindex $arg 4] == "usual" || [lindex $arg 4] == "usual."} {
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
	upvar #0 at_line at_line_local pronoun_possesive pronoun_possesive_local pronoun_objective pronoun_objective_local
	set_gender $nick $chan
	if {$at_line_local == "absolutely nobody"} {
		return
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
	set odds [rand 210]
	putlog "Detected quit $nick $odds"
	if {$odds < 13} {
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
			set odds2 [rand 117]
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
	set odds [rand 100]
	putlog "Detected part $nick"
	if {$odds < 10} {
		putserv "PRIVMSG $chan :\001ACTION goes over to $nick's table and takes the glasses away.\001"
		return
	}
	return
}

proc pub_round {nick mask hand chan arg} {
	putquick "PRIVMSG $chan :\001ACTION serves a round of beverages, courtesy of $nick.\001"
}

proc pub_informal {nick mask hand chan arg} {
	putquick "PRIVMSG $chan :Please, $nick, call me Mike."
}
# end pub_informal

proc pub_help {nick mask hand chan arg} {
	if {[lindex $arg 2] == ""} {
	putserv "PRIVMSG $chan :You can see all my documented features & registering info at http://3whack.org/mike/help.html"
	putserv "PRIVMSG $chan :For extensive NOTES help, please see the info at http://3whack.org/mike/notes.html"
	return
	}
}

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
	putlog "Reached pub_line; at_line_local == $at_line_local"
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
"a Seven & 7"
"a Cuba Libre"
"a Tuba Libre"
"a Screaming Orgasm"
"some ice cubes"
"the bar towel"
"the bar trowel"
"a Shirley Temple"
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
	putlog "resetting; $at_line_local"
	putserv "PRIVMSG $chan :\001ACTION rubs his eyes, and realizes he was seeing things.\001"
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
	set_gender $patron_local $chan
	set odds [rand 30]
	set patron_temp $patron_local
	set patron_length [string length $patron_temp]
	#We need to tell FUGLY how many characters we want to use to match with. If the patron's nick used is less than or equal to 5, we pass the length of it; if it is greater than 5, we only check for the first 5 to match.
	if {$patron_length <= 5} {
		patron_match $patron_temp $chan $patron_length
	}
	
	if {[string length $patron_temp] > 5} {
		#This is where we pass the patron  & channel that is requested to be hosed to FUGLY, and the length we're using for a "match"
		patron_match $patron_temp $chan 5
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

proc pub_hose {nick mask hand chan arg} {
	upvar #0 patron patron_local
	set patron_length 0
	set patron_local [lindex $arg 2]
	set odds [rand 30]
	set patron_temp $patron_local
	set patron_length [string length $patron_temp]
	#We need to tell FUGLY how many characters we want to use to match with. If the patron's nick used is less than or equal to 5, we pass the length of it; if it is greater than 5, we only check for the first 5 to match.
	if {$patron_length <= 5} {
		patron_match $patron_temp $chan $patron_length
	}
	
	if {[string length $patron_temp] > 5} {
		#This is where we pass the patron  & channel that is requested to be hosed to FUGLY, and the length we're using for a "match"
		patron_match $patron_temp $chan 5
	}

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

proc pub_yoda_ball {nick mask hand chan arg} {
	global yoda yoda2
	putserv "PRIVMSG $chan :I don't know, $nick let's ask Yoda."
	putserv "PRIVMSG $chan :\001ACTION grabs Yoda and [lindex $yoda2 [rand [llength $yoda2]]]\001"
	putserv "PRIVMSG $chan :Yoda says, '[lindex $yoda [rand [llength $yoda]]]'"
}

proc pub_unhandcuff {nick mask hand chan arg} {
	global odds3
	putcmdlog "$chan: <$nick> $arg"
	set odds3 [rand 10]
	putlog "DEBUG CP keys $odds3"
	if {$odds3 >= 0 || $odds3 <= 4} {
		putserv "PRIVMSG $chan :\001ACTION tosses $nick the handcuff keys.\001"
	}
	if {$odds3 >= 5 || $odds3 <= 7} {
		putserv "PRIVMSG $chan :No way, Jose!"
	}
	if {$odds3 == 8} {
		putserv "PRIVMSG $chan :What are you gonna do for me, $nick ?"
	}
	if {$odds3 == 9} {
		putserv "PRIVMSG $chan :\001 hides the keys.\001"
	}
}

proc pub_hug {nick mask hand chan text} {
	putserv "PRIVMSG $chan :\001ACTION hugs $nick.\001"
}

proc pub_re {nick mask hand chan text} {
	putserv "PRIVMSG $chan : re $nick."
}

proc pub_chocolate {nick mask hand channel text} {
   global chocolate
   puthelp "PRIVMSG $channel :\001ACTION gives $nick some [lindex $chocolate [rand [llength $chocolate]]].\001"
}

proc act:action_event {nick mask hand chan keyword arg} {
	upvar #0 name name_local
	upvar #0 at_line at_line_local
	upvar #0 random_patron random_patron_local
	set counter 0
	name_check $arg $chan
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
		set odds [rand 300]
		if {$odds >= 0 && $odds <= 43} {
			putserv "PRIVMSG $chan :\001ACTION hangs a sign on $nick with 'Do Not Disturb until [expr [rand 27] + 1][lindex $month [rand [llength $month]]], [expr [rand 15] + 2008]' on it.\001"
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
			putserv "PRIVMSG $chan :\001ACTION gets out some dark glasses, and nueralizes $nick.\001"
			puthelp "PRIVMSG $chan :You did not see that flash of light which did not erase your memory."
			puthelp "PRIVMSG $chan :\001ACTION puts the dark glasses away, and goes back to polishing the bartop.\001"
			return
		}
		return
}
##### Adding response to back messages 14FEB2008 bkc

if {[lindex $arg 0] == "is" && [lindex $arg 1] == "back"} {
		set odds [rand 300]
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



set random_actions {
"thumbs through the Bartender's Guide."
"thumbs through the Bartender's Guide."
"places his hand on the closed Bartender's Guide and absorbs the information through osmosis."
"pulls out a copy of Callahan's Key and begins reading it."
"pulls out a copy of Callahan's Key and begins reading it, planning his 'Behind the Scenes' featurette for the HD-DVD."
"wanders around The Place hugging random patrons."
"wanders around The Place hugging non-random patrons."
"checks the pantry for some Budweiser beer."
"checks the pantry for some Budweiser beer, discarding the case he finds of it."
"checks the pantry for some Corona beer."
"checks the pantry for some Killian's Irish Red beer."
"checks the pantry for some Mojo Ale."
"checks the pantry for some D^3 IPA."
"checks the pantry for some Druthers & Dregs Two Pint Cider."
"checks the pantry for some Back Hand of God beer."
"checks the pantry for some Oregon Trail Brewery Wit."
"checks the pantry for some Smirnoff Ice Green Apple Bite."
"checks the pantry for some homemade mead from Jax."
"checks the pantry for some Smirnoff Ice Pomegranate Fusion ."
"checks the pantry for some Chambord."
"checks the pantry for some Guinness beer."
"checks the pantry for some McMenamin's Ruby."
"checks the pantry for some sake."
"checks the pantry for some Black Butte Porter beer."
"checks the pantry for some Terminator Stout."
"checks the pantry for some Tullamore Dew."
"checks the trash for some MGD beer."
"checks the trash for some MGD beer.  Seeing none, he adds it."
"checks the pantry for some generic beer."
"checks Da5id's pulse."
"checks ManInBlack's pulse."
"checks Pix's pulse."
"checks the pantry for some baking soda."
"checks the pantry for some Sloppy Joe mix."
"checks the pantry for some anchovies."
"checks the pantry for some egg noodles."
"checks the storage room for some cat litter."
"checks the storage room for some cat litter, and adds it to the grocery list."
"sweeps the glass from the Fireplace."
"replenishes the supply of quarters in the Cigar Box."
"goes through the supply of quarters in the Cigar Box looking for any pre-1965 ones."
"munches on some peanuts."
"munches on some pretzels."
"munches on some olives."
"takes a tart from Oberon's cart."
"reads Groklaw, and chuckles."
"polishes the bartop with some SCO stock, and disposes of it."
"takes a cat nap."
"takes the cat's nap."
"waves his hand and a warm fire appears in the fireplace."
"mumbles to himself."
"mutters to himself."
"looks up and smiles."
"looks up and grins."
"chuckles, and gives no answer as to why."
"sips his drink."
"guzzles his drink."
"tosses a shot down the hatch."
"tosses a shot up the hatch."
"lights a Cuban cigar."
"lights a Philly Blunt."
"reads through http://bash.org"
"glances through the Farmer's Almanac."
"glances through the current issue of Wired."
"glances through a back issue of Wired."
"glances through the current issue of Redbook."
"glances through a back issue of Redbook."
"dusts around the mantle."
"dusts around the jukebox."
"dusts around rain_man."
"refills the peanut bowls on the bar."
"refills the pretzel bowls on the bar."
"refills the other bowls on the bar."
"lights a fresh cigar."
"lights a stale cigar."
"takes out the garbage."
"polishes X."
"reads through How To Win Friends and Influence People, and makes corrections."
"walks through the Place, straightening chairs."
"reboots the Windows computer at the end of the bar."
}

set yoda {
"Unclear the future is. Again try later."
"Ouch! Hurts that does."
"Do, there is no try."
"This one's grip, strong is."
"Unclear the future is. Maybe."
"Should you, possible is."
"Of me hard questions ask not."
"Yes.  Ease up you should."
"No, I think this is."
"No, the answer must be."
"Yes, I think this is."
"Yes, the answer must be."
"Cloudy the future is."
"Hmmmmm, disturbing is the Force, unclear the answer is."
}

set yoda2 {
"tosses him like a dwarf."
"flips him like a coin."
"pulls him over. 'We need an answer, big boy!'"
"tickles him like an Elmo doll."
"pokes him in the belly like he's the Pillsbury Doughboy."
"strokes his ear like a Ferengi."
}

 set chocolate {
 "Lindt Chocolate"
 "E Guittard "
 "Godiva Chocolate"
 "Reese's Cups"
 "KitKats"
 "Nestlé's CRUNCH"
 "Snickers bars"
 "Dark Chocolate fondue with strawberries"
 "Hershey's Kisses"
 "Milky Way bars"
 "Nutella and a loaf of french bread"
 "Chocloate Runts"
 "Raisinettes from the Apollo theatre floor"
 "Chocolate covered gummi bears"
 "Chocolate covered coffee beans"
 "Inside Out Reese's.  Strange, but good"
 }


# proc_name_check moved to fugly

proc pub_long {nick mask hand chan arg} {
	global odds3
	set odds3 [rand 150]
	putlog "$odds3"
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
		
	if {$odds3 >= 93} {
		putserv "PRIVMSG $chan :\001ACTION runs down field, drops the ball, and starts asking the ref to call interference on $random_patron_local.\001"
		return
	}
	return
}
