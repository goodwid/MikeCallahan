# music.tcl v1
#
# music items to play
#
# Coded by David Goodwin <goodwid@gmail.com> & Brendan K Callahan <420420@gmail.com> 2006 & 2007
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
#

putlog "o/~ Just sing, sing a song. . .o/~"




proc pub_music {nick mask hand chan arg} {
	# set this to where your data file lives
        set file "./scripts/jukebox.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set music [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, then prints to channel.
	foreach line [split [lindex $jukebox [rand [llength $jukebox]]] ¶] {
		check_recent_output jukeboxt $line
	}
	while {$recent_output_local == 1} {
		foreach line [split [lindex $jukebox [rand [llength $jukebox]]] ¶] {
			check_recent_output jukebox $line
		}
	}
		cycle_recent_output jukebox $line
	putserv "PRIVMSG $chan :\001ACTION goes over to the bartop computer, fires up XMMS which starts to play $line.\001"	

	return
	}

