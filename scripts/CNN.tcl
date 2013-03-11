# Eggdrop CNN RSS Script 
# Copyright 2006-2009 by Brendan K Callahan <brendan.k.callahan@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
global cnn_mode cnn_output_raw
set cnn_raw_output ""

proc pub_cnn {nick host hand chan arg} {
	upvar #0 cnn_mode cnn_mode_local
	set arg [string tolower $arg]
	if {[lindex $arg 2] == ""} {set cnn_mode_local "top"}
	if {[lindex $arg 2] == "us"} {set cnn_mode_local "us"}
	if {[lindex $arg 2] == "tech"} {set cnn_mode_local "tech"}
	if {[lindex $arg 2] == "politics"} {set cnn_mode_local "politics"}
	
	if {[lindex $arg 2] == "more"} {set cnn_mode_local "top";pub_cnn_get;pub_cnn_output_more $nick $chan;return}
	if {[lindex $arg 3] == "more" && [lindex $arg 2] == "us"} {set cnn_mode_local "us";pub_cnn_get;pub_cnn_output_more $nick $chan;return}
	if {[lindex $arg 3] == "more" && [lindex $arg 2] == "tech"} {set cnn_mode_local "tech";pub_cnn_get;pub_cnn_output_more $nick $chan;return}
	if {[lindex $arg 3] == "more" && [lindex $arg 2] == "politics"} {set cnn_mode_local "politics";pub_cnn_get;pub_cnn_output_more $nick $chan;return}
	pub_cnn_get
	pub_cnn_output $nick $chan
	#putserv "PRIVMSG $chan :Would you like to know more? Just add 'more' to the end for private feed."
	return
}

proc pub_cnn_get {} {
	upvar #0 cnn_output_raw cnn_output_raw_local cnn_mode cnn_mode_local
	set cnn_output_raw_local ""
	set rawXML [socket -async www.cnn.com 80]
	if {$cnn_mode_local == "top"} {puts $rawXML "GET /rss/cnn_topstories.rss"}
	if {$cnn_mode_local == "us"} {puts $rawXML "GET /rss/cnn_us.rss"}
	if {$cnn_mode_local == "politics"} {puts $rawXML "GET /rss/cnn_allpolitics.rss"}
	if {$cnn_mode_local == "tech"} {puts $rawXML "GET /rss/cnn_tech.rss"}
	flush $rawXML
	set counter 1
	while {$counter < 150} {incr counter;lappend cnn_output_raw_local [gets $rawXML]}
	close $rawXML
	return

}

proc pub_cnn_output {nick chan} {
	upvar #0 cnn_output_raw cnn_output_raw_local cnn_mode cnn_mode_local phrase phrase_local
	set phrase_local [lindex $cnn_output_raw_local 18]
	pub_trim_left 7
	pub_trim_right 9
	set cnn_news1 $phrase_local
	set phrase_local [lindex $cnn_output_raw_local 20]
	pub_trim_left 6
	pub_trim_right 8
	set cnn_news2 $phrase_local
	putserv "PRIVMSG $chan :$cnn_news1 $cnn_news2 -- more?"
	return
}

proc pub_cnn_output_more {nick chan} {
	upvar #0 cnn_output_raw cnn_output_raw_local cnn_mode cnn_mode_local phrase phrase_local
	set counter 0
	set counter2 18
	set counter3 20
	while {$counter < 5} {
		set phrase_local [lindex $cnn_output_raw_local $counter2]
		pub_trim_left 7
		pub_trim_right 9
		set cnn_news1 $phrase_local
		set phrase_local [lindex $cnn_output_raw_local $counter3]
		pub_trim_left 6
		pub_trim_right 8
		set cnn_news2 $phrase_local
		putserv "PRIVMSG $nick :$cnn_news1 $cnn_news2"
		incr counter
		incr counter2 7
		incr counter3 7
	}
	return
}

proc pub_trim_left {amount} {
	upvar #0 phrase phrase_local
	set counter $amount
	while {$counter <= [string length $phrase_local]} {
		append phrase_local_temp [string index $phrase_local $counter]
		incr counter
	}
	set phrase_local $phrase_local_temp
	return
}

proc pub_trim_right {amount} {
	upvar #0 phrase phrase_local
	set counter 0
	while {$counter <= [expr [string length $phrase_local] - $amount]} {
		append phrase_local_temp [string index $phrase_local $counter]
		incr counter
	}
	set phrase_local $phrase_local_temp
	return
}