# useless.tcl v1
#
# Quotes from useless Naranek, Vorlon Ambassador to Babylon 5, 2260-2262
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "How about that \$local_sports_team?"




proc pub_useless {nick mask hand chan arg} {
		upvar #0 recent_output recent_output_local
	# set this to where your data file lives
        set file "./scripts/useless.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set useless [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $useless [rand [llength $useless]]] ¶] {
		check_recent_output useless $line
	}
	while {$recent_output_local == 1} {
		foreach line [split [lindex $useless [rand [llength $useless]]] ¶] {
			check_recent_output useless $line
		}
	}
		cycle_recent_output useless $line 
		putquick "PRIVMSG $chan :$line"		
}
##### end pub_useless
