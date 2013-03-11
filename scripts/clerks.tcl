# clerks.tcl v1
#
# Quotes from the movie Ghostbusters
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
#
# Point this to where your data file lives:

putlog "I'm not even supposed to be here today!  Clerks v1 loaded successfully."

bind pubm - *Mike,~clerks* pub_clerks


proc pub_clerks {nick mask hand chan arg} {
        set file "./scripts/clerks.egt"

        set temp_file [open $file "r"]
        set ghost [split [read -nonewline $temp_file] "\n"]
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	foreach line [split [lindex $ghost [rand [llength $ghost]]] '@@'] { putquick "PRIVMSG $chan :$line" }
}
