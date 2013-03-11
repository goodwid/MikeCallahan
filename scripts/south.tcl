# south.tcl v1
#
# Quotes from South Park
#
# Copyright 2006-2008 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "You killed Kenny, you BASTARD"

bind pubm - *Mike,~south* pub_south


proc pub_south {nick mask hand chan arg} {
	# set this to where your data file lives
        set file "./scripts/south.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set south [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $south [rand [llength $south]]] @@] { putserv "PRIVMSG $chan :$line"	}
}
##### end pub_south

