# pinky.tcl v1
#
# Quotes from Pinky & the Brain
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Pinky & the Brain 0.1 - loaded."

bind pubm - *Mike,~pinky* pub_pinky
bind pubm - *Mike,~brain* pub_pinky


proc pub_pinky {nick mask hand chan arg} {
	# set this to where your data file lives
        set file "./scripts/pinky.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set pinky [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $pinky [rand [llength $pinky]]] @@] { putserv "PRIVMSG $chan :$line"	}
}
##### end pub_pinky

