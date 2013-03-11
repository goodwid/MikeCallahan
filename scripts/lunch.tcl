# lunch.tcl v1
#
# lunch items to serve
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Would you like flies with that?"

bind pubm - *Mike,~lunch* pub_lunch


proc pub_lunch {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local
	# set this to where your data file lives
        set file "./scripts/lunch.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set lunch [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $lunch [rand [llength $lunch]]] @@] { 
	putserv "PRIVMSG $chan :For lunch, we have $line $nick"	
	putcmdlog "$chan: <$nick> $arg $line"
	set menu_item_local $line
	return
	}
}
##### end pub_lunch
