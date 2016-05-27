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

putlog "URL Catcher v0.1"






proc public_url_extracter {nick mask hand chan arg} {
	set counter 0
	set nws_flag 0
	set temp_string ""
	while {$counter < [llength $arg]} {
		if {[string compare -length 7 "http://" [lindex $arg $counter]] == 0} {set url [lindex $arg $counter]}
		if {[string compare -nocase -length 3 "nws" [lindex $arg $counter]] == 0} {set nws_flag 1}
		if {[string compare -nocase -length 4 "nsfw" [lindex $arg $counter]] == 0} {set nws_flag 1}
		incr counter
	}
	set temp_string $nws_flag
	append temp_string " [clock seconds] " $url
		#Opening the file, writing, and closing it cleanly.
		set file_name "./scripts/url_history.egt"
       		set temp_file [open $file_name "a"]
		puts $temp_file $temp_string
		flush $temp_file
		close $temp_file

		#notifying authorized quote adders online that it has been added. 
		putlog "URL added: $url  NWS Flag: $nws_flag"
		set last_quoter_local $nick;set last_quote_local $temp_string
		return
	}
