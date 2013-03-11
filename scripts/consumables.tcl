# appetizer.tcl v2
#
# appetizer items to serve
#
# Copyright 2006-2008 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <brendan.k.callahan@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

global booze_item 
global menu_item

proc pub_appetizer {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local spew_buffer spew_buffer_local recent_output recent_output_local
	pub_spew $chan appetizer 10 "For an appetizer, we have " "" ""
	set menu_item_local $spew_buffer_local
}

proc pub_booze {nick mask hand chan arg} {
	upvar #0 booze_item booze_item_local spew_buffer spew_buffer_local recent_output recent_output_local
	pub_spew $chan booze 50 "\001ACTION wheels out a mini-bar with supplies for " ".\001" ""
	set booze_item_local $spew_buffer_local
}

proc pub_breakfast {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local spew_buffer spew_buffer_local recent_output recent_output_local user_name user_name_local
	if {[lindex $arg 1] == "breakfastclub"} {return}	
	pub_spew $chan breakfast 10 "How about " " for breakfast, $nick?" ""
	set menu_item_local $spew_buffer_local
}

proc pub_brunch {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local spew_buffer spew_buffer_local recent_output recent_output_local
	pub_spew $chan brunch 10 "Well, $nick, for brunch we have " "." ""
	set menu_item_local $spew_buffer_local
}

proc pub_dessert {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local spew_buffer spew_buffer_local recent_output recent_output_local
	pub_spew $chan dessert 10 "\001ACTION wheels out a dessert cart containing " ".\001" ""
	set menu_item_local $spew_buffer_local
}

proc pub_dinner {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local spew_buffer spew_buffer_local recent_output recent_output_local
	pub_spew $chan dinner 10 "For dinner, we have " "." ""
	set menu_item_local $spew_buffer_local
}

proc pub_lunch {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local spew_buffer spew_buffer_local recent_output recent_output_local
	pub_spew $chan lunch 10 "For lunch, we have " "." ""
	set menu_item_local $spew_buffer_local
}

proc pub_beer {nick mask hand chan arg} {
	upvar #0 booze_item booze_item_local spew_buffer spew_buffer_local recent_output recent_output_local patron patron_local name name_local
	if {[lindex $arg 2] == "me"} {
		pub_spew $chan beer 15 "\001ACTION serves $nick " ".\001" ""
		set booze_item_local $spew_buffer_local
		return
	}
	name_check [lindex $arg 2] $chan
	if {$name_local == 1 || [lindex $arg 2] == "yourself"} {
		pub_spew $chan beer 15 "\001ACTION serves himself " ", courtesy of $nick.\001" ""
		set booze_item_local $spew_buffer_local
		return
	}
	patron_match [lindex $arg 2] $chan [string length [lindex $arg 2]]
	if {$patron_local == "NoMatchesFound"} {
		pub_spew $chan beer 15 "\001ACTION serves $nick " ", instead, since [lindex $arg 2] isn't here!\001" ""
		set booze_item_local $spew_buffer_local
		return
	}
	pub_spew $chan beer 15 "\001ACTION serves $patron_local " ", courtesy of $nick.\001" ""
	set booze_item_local $spew_buffer_local
}

proc pub_unusual {nick mask hand chan arg} {
	upvar #0 spew_buffer spew_buffer_local recent_output recent_output_local
	pub_spew $chan unusual 15 "\001ACTION rumages under the bar and gives $nick " ".\001" ""
}

proc pub_snack {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local spew_buffer spew_buffer_local recent_output recent_output_local
	set price {
	"US\$1.75"
	"US\$1.50"
	"US\$1.25"
	"US\$1.00"
	"US\$0.90"
	"US\$0.85"
	"US\$0.75"
	"CA\$1.55"
	"CA\$1.30"
	"CA\$1.05"
	"CA\$0.80"
	"CA\$1.80"
	"CA\$2.00"
	"AU\$1.75"
	"AU\$1.50"
	"AU\$3.50"
	"AU\$3.00"
	"AU\$2.00"
	"AU\$2.25"
	"AU\$2.75"
	}
	pub_spew $chan snack 10 "How about " ", $nick, for [lindex $price [rand [llength $price]]], from the vending machine?" ""
	set menu_item_local $spew_buffer_local
}

proc pub_tea {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local spew_buffer spew_buffer_local recent_output recent_output_local
	putserv "PRIVMSG $chan :\001ACTION wheels out a cart with a samovar, thick cream, 100% cane sugar, your choice of Tillamook Valley Wild Blackberry Honey or Premium Basswood, and organic lemon wedges.\001"
	pub_spew $chan tea 15 "Today's special is " "." ""
	set menu_item_local $spew_buffer_local
}

proc pub_other_beer {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local patron patron_local spew_buffer spew_buffer_local
	set patron_local [lindex $arg 5]
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
		pub_spew $chan beer 15 "\001ACTION serves $patron_target " ", courtesy of $nick.\001" ""
		return
	}
	if {$odds == 28 || $odds == 29} {
		pick_random_patron $chan
		while {$nick == $patron_local} {
			pick_random_patron $chan
		}
		pub_spew $chan beer 15 "\001ACTION grins and serves $patron_local " " instead.\001" ""
		return
	}
	pub_spew $chan beer 15 "\001ACTION serves $nick " " instead.\001" ""
	return	
}

proc pub_other_unusual {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local patron patron_local random_patron random_patron_local
	patron_match [lindex $arg 2] $chan [string length [lindex $arg 2]]
	if {$patron_local == "NoMatchesFound"} {
		pick_random_patron $chan
		set patron_local $random_patron_local
	}
	set odds [rand 30]
	if {$odds < 4} {
		pub_spew $chan unusual 15 "\001ACTION rummages around under the bar and hands $patron_local " ", courtesy of $nick\001" ""
		return
	}
	
	if {$odds == 4} {
		pub_spew $chan unusual 15 "\001ACTION rummages around under the bar, turns pale briefly then rummages around some more and hands $patron_local " ", courtesy of $nick\001" ""
		return
	}
	
	if {$odds == 5 || $odds == 6} {
		pub_spew $chan unusual 15 "\001ACTION rummages around under the bar, giggles and rummages around some more and hands $patron_local " ", courtesy of $nick\001" ""
		return
	}
	
	if {$odds == 7 || $odds == 8} {
		pub_spew $chan unusual 15 "\001ACTION rummages around under $random_patron_local's seat and hands $patron_local " ", courtesy of $nick\001" ""
		return
	}
	
	if {$odds == 9} {
		putserv "PRIVMSG $chan :Sorry $nick, we're fresh out!"
		return
	}
	pub_spew $chan unusual 15 "\001ACTION rummages around under the bar & hands $patron_local " ".\001" ""
}

proc pub_queso {nick mask hand chan arg} {
	upvar #0 rgt_output rgt_output_local filled filled_local
	if {[lindex $arg 1] == "withdraw"} {
		if {![matchattr [nick2hand $nick] +C]} {
			putlog "$nick doesn't have +C"
			putserv "PRIVMSG $chan :Sorry, you don't have authorization withdraw from the cheese vault, $nick."
			return
		}

		get_recent_output queso [lindex $arg 2]
		putserv "PRIVMSG $chan :\001ACTION gives $nick the $rgt_output_local from bin number [lindex $arg 2] in the vault.\001"
		
		
		return
	}
	
	if {[lindex $arg 1] == "deposit"} {
		set cheese_deposit ""
		if {![matchattr [nick2hand $nick] +C]} {
			putlog "$nick doesn't have +C"
			putserv "PRIVMSG $chan :Sorry, you don't have authorization to deposit to the cheese vault, $nick."
			return
		}
		set counter 3
		while {$counter < [llength $arg]} {
			lappend cheese_deposit [lindex $arg $counter]
			incr counter
		}
		put_recent_input queso [lindex $arg 2] $cheese_deposit $nick $chan
		if {$filled_local != 1} {
			putserv "PRIVMSG $chan :$nick, I've put the $cheese_deposit into bin number [lindex $arg 2] in the vault for you."
		}
		return
	}

	if {[lindex $arg 1] == "list" && [lindex $arg 2] == "vault"} {
		list_recent_input queso $nick
	}
}
