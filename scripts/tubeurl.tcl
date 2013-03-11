# snipurl.tcl v1.0
#
# 
#
# Copyright 2006-2009 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5

putlog "LOADED SnipURL"
bind pubm - * bris_proc


proc bris_proc { nick host handle chan text } {
	global http_timeout
	set counter 0
	set URL_text ""
	
	while {$counter < [llength $text]} {
		if {![string match -nocase "http://*" [lindex $text $counter]] && [string match -nocase "www.*" [lindex $text $counter]]} {
			set www_text "[lindex $text $counter]"
			set URL_text "http://$www_text"
		}
		if {[string match -nocase "http://*" [lindex $text $counter]]} {
			set URL_text "[lindex $text $counter]"
		}
		incr counter
	}
	
	if {$URL_text	!= ""  && [string length $URL_text] > 79} {
	set page [::http::config -useragent "MSIE 6.0"]
	set snipuser "callahan"
	set snipapi "bd3bbaf9d1aaff28727915c4f170b53a"
	set sniplink "$URL_text"
	set page [::http::geturl "http://snipr.com/site/getsnip" -query [http::formatQuery "sniplink" $sniplink "snipuser" $snipuser "snipapi" $snipapi ] -timeout 25000]
	if { [::http::status $page] == "timeout" } {
		putquick "PRIVMSG $chan :\002$nick: The connection timed out while doing the initial search for a snipped URL.\002"
		::http::Finish $page
		return
	}
 	set html [::http::data $page]
	::http::Finish $page
	
	##### Turn return data into list
	set html [split $html \n]
	
	##### Grab the element we want
	set snipped_url_raw1 [lindex $html 1]
	putlog "Raw Return: $html"
	
	##### Trim the uneeded characters from the URL
	set snipped_url_raw2 [string trimright $snipped_url_raw1 "</id> "]
	set snipped_url [string trimleft $snipped_url_raw2 "  <id>"]
		
	##### Send polished output to channel.
	putserv "PRIVMSG $chan :$nick, you may use $snipped_url for a shorter URL."
 }
}