# breakfast.tcl v1
#
# Breakfast items to serve
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Mega Mooby McMuffin on the grill. . ."

bind pubm - *Mike,~breakfast pub_breakfast


proc pub_breakfast {nick mask hand chan arg} {

	if {[lindex $arg 1] == "breakfastclub"} {
	return
	}
	upvar #0 menu_item menu_item_local
	# set this to where your data file lives
        set file "./scripts/breakfast.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set breakfast [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $breakfast [rand [llength $breakfast]]] @@] { putserv "PRIVMSG $chan :How about $line for breakfast, $nick?"	
	putcmdlog "$chan: <$nick> $arg $line"
	set menu_item_local $line
	return
	}
	
}
##### end pub_breakfast
