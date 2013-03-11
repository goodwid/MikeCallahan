# snack.tcl v1
#
# snack items to serve
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

putlog "Once you try snack, you never go back! (Vending machine loaded)"

bind pubm - *Mike,~snack* pub_snack


proc pub_snack {nick mask hand chan arg} {
	set price {
	"US\$1.75"
	"US\$1.50"
	"US\$1.25"
	"US\$1.00"
	"US\$0.90"
	"US\$0.85"
	"US\$0.75"
	"CA\$1.75"
	"CA\$1.50"
	"CA\$1.25"
	"CA\$1.00"
	"CA\$2.00"
	"CA\$2.25"
	"AU\$2.75"
	"AU\$4.25"
	"AU\$4.50"
	"AU\$3.50"
	"AU\$3.00"
	"AU\$2.00"
	"AU\$2.25"
	"AU\$2.75"
	}
	upvar #0 menu_item menu_item_local
	# set this to where your data file lives
        set file "./scripts/snack.egt"

	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set snack [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file      

	putcmdlog "$chan: <$nick> $arg"
	# Picks a random line from the list, and parses out the multi-line quotes, then prints to channel.
	foreach line [split [lindex $snack [rand [llength $snack]]] @@] {
	putquick "PRIVMSG $chan :\001ACTION checks the vending machine's contents. . .\001"
	puthelp "PRIVMSG $chan :How about $line, $nick, for [lindex $price [rand [llength $price]]]?"	
	putcmdlog "$chan: <$nick> $arg $line"
	set menu_item_local $line
	return
	}
}
##### end pub_snack
