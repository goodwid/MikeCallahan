set http_timeout	25000
#bind pub - !1213 123_proc
bind pubm - * 123_proc
#####################################################
# source scripts/http.tcl
proc 123_proc { nick host handle chan text } {
	global http_timeout
	if {![string match -nocase "http://*" [lindex $text 0]] && ![string match -nocase "www.*" [lindex $text 0]]} {return}
	if {![string match -nocase "http://*" [lindex $text 0]] && [string match -nocase "www.*" [lindex $text 0]]} {set text "http://$text"}
	set page [::http::config -useragent "MSIE 6.0"]
	set page [::http::geturl http://tubeurl.com/short.php?url=[lindex $text 0] -timeout $http_timeout]
	if { [::http::status $page] == "timeout" } {
		putquick "PRIVMSG $chan :\002Connection timed out while doing initial search.\002"
		::http::Finish $page
		return
	}
 	set html [::http::data $page]
	::http::Finish $page
	set html [split $html \n]
	putserv "PRIVMSG $chan :$html"
 }