# tea.tcl v1
#
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Pardon me, do you have any Earl Grey?  tea v1 loaded."

bind pubm - *Mike,~tea* pub_tea


proc pub_tea {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local
	# set this to where your data file lives
        set file "./scripts/tea.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set tea [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	putserv "PRIVMSG $chan :\001ACTION wheels out a cart with a samovar, thick cream, 100% cane sugar, your choice of Tillamook Valley Wild Blackberry Honey or Premium Basswood, and organic lemon wedges.\001"

	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $tea [rand [llength $tea]]] @@] {
		puthelp "PRIVMSG $chan :Today's special is $line."
		putcmdlog "$chan: <$nick> $arg $line"
		set menu_item_local $line
		return
	}
}
##### end pub_tea
