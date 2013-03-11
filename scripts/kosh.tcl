# kosh.tcl v1
#
# Quotes from Kosh Naranek, Vorlon Ambassador to Babylon 5, 2260-2262
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Who are you?   Kosh v1 loaded successfully."

bind pubm - *Mike,~kosh pub_kosh


proc pub_kosh {nick mask hand chan arg} {
	# set this to where your data file lives
        set file "./scripts/kosh.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set kosh [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $kosh [rand [llength $kosh]]] @@] { putquick "PRIVMSG $chan :$line"	}
}
##### end pub_kosh
## Testing save, or save/close

