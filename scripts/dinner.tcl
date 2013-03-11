# dinner.tcl v1
#
# dinner items to serve
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "A 9 course meal? What is this, the back nine at Hiawatha?"

bind pubm - *Mike,~dinner* pub_dinner


proc pub_dinner {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local
	# set this to where your data file lives
        set file "./scripts/dinner.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set dinner [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $dinner [rand [llength $dinner]]] @@] { 
	putserv "PRIVMSG $chan :For dinner, we have $line."	
	putcmdlog "$chan: <$nick> $arg $line"
	set menu_item_local $line
	return
	}
}
##### end pub_dinner
