# patron_quotes.tcl v2
#
# patron_quotes items to serve
#
# Copyright 2006-2009 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "#########################You have the right to remain silent (We stongly suggest this) Testing."




proc pub_patron_quotes {nick mask hand chan arg} {
	upvar #0 menu_item menu_item_local
	set mc "�"
	# set this to where your data file lives
        set file "./scripts/patron_quotes.egt"
        #set file "./scripts/ghost.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set patron_quotes [split [read -nonewline $temp_file] "\n"]

	# file cleanup
        close $temp_file      
	set patron_quotes_list ""
	set patron_quotes_parsed ""

	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	if {[llength $arg] < 3} {
		foreach line [split [lindex $patron_quotes [rand [llength $patron_quotes]]] $mc] {
			putlog "*****$line"
			putserv "PRIVMSG $chan :$line"
		}
		return
	}
	
	if {[llength $arg] > 2} {
	set counter 0
	while {$counter < [llength $patron_quotes]} {
		if {[string first "[string tolower [lindex $arg 2]]" "[string tolower [lindex $patron_quotes $counter]]" 1] != -1} {
			lappend patron_quotes_parsed [lindex $patron_quotes $counter]
		}
		incr counter
	}
	
	if {[llength $patron_quotes_parsed] > 0} {
		putlog "# of matches found:[llength $patron_quotes_parsed]  $chan: <$nick> $arg"
		foreach line [split [lindex $patron_quotes_parsed [rand [llength $patron_quotes_parsed]]] $mc] {
			putlog "$line"
			putquick "PRIVMSG $chan :$line"
			}
			return
		}
	if {[llength $patron_quotes_parsed] == 0} {
		putquick "PRIVMSG $chan :\001ACTION tells $nick that he can't find anything with '[lindex $arg 2]' in it.\001"
		return
	}
}
}

##### end pub_patron_quotes

proc pub_quotes_count {nick mask hand chan arg} {
	putlog "Got to counting quotes"
  set file "./scripts/patron_quotes.egt"
  set temp_file [open $file "r"]
  set patron_quotes [split [read -nonewline $temp_file] "\n"]
  close $temp_file      
	set count_quote [llength $patron_quotes]
		putserv "PRIVMSG $chan :I currently have $count_quote quotes in my notebook."
}
##### end pub_patron_quotes
