# amore.tcl v1
#
# amore.
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Amore v1 loaded successfully."

bind pubm - *Mike,~amore* pub_amore


proc pub_amore {nick mask hand chan arg} {
	# set this to where your data file lives
        set file "./scripts/amore.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set amore [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $amore [rand [llength $amore]]] @@] { putquick "PRIVMSG $chan :$line"	}
}
##### end pub_amore
