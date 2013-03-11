# Eggdrop Google Script 
# Copyright 2006 by Brendan K Callahan <420420@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
putlog "Fucking google it n00b!"
bind pubm - "% Mike,~google*" pub_google

proc pub_google {nick host hand chan arg} {
	set google_term ""
	set counter 2
	while {$counter < [llength $arg]} {lappend google_term [lindex $arg $counter];incr counter}
	set counter 0
	while {$counter < [llength $google_term]} {
	append google_term_string [lindex $google_term $counter]
	incr counter
		if {$counter < [llength $google_term]} {append google_term_string "+"}
	}
	putquick "NOTICE $nick :$google_term_string"
	pub_google_get $google_term_string $nick
	#pub_google_output $nick
	return
}


proc pub_google_get {google_term_string nick} {
	upvar #0 google_output google_output_local
	if {[catch {exec curl --basic --get --output scripts/google.temp.egt --data search=$google_term_string http://www.google.com//search?q=$google_term_string}]} {}
	set counter 1
	set file "./scripts/google.temp.egt"
	set temp_file [open $file "r"]
  set google_output_raw_local [read -nonewline $temp_file]
  close $temp_file
	return
}

proc pub_google_output {nick} {
	upvar #0 google_output google_output_local
	set counter 0
	putlog "got here"
	while {$counter < [llength $google_output_local]} {set output [lindex $google_output_local $counter]; putquick "NOTICE $nick :$output";incr counter}
	return
}