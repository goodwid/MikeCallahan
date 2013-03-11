# ghost.tcl v1
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

putlog "Who you gonna call?   Ghostbusters v1 loaded successfully."




proc pub_ghost {nick mask hand chan arg} {
	upvar #0 recent_output recent_output_local
        set file "./scripts/ghost.egt"

        set temp_file [open $file "r"]
        set ghost [split [read -nonewline $temp_file] "\n"]
        close $temp_file      

	foreach line [split [lindex $ghost [rand [llength $ghost]]] ¶] {
		check_recent_output ghost $line
	}
	while {$recent_output_local == 1} {
		foreach line [split [lindex $ghost [rand [llength $ghost]]] ¶] {
			check_recent_output ghost $line
		}
	}
		cycle_recent_output ghost $line
	 putquick "PRIVMSG $chan :$line" 
}
