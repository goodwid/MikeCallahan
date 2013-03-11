# Eggdrop wikipedia search Script 
# Copyright 2006-2009 by Brendan K Callahan <brendan.k.callahan@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
global wikipedia_mode wikipedia_output_raw
set wikipedia_raw_output ""

proc pub_wikipedia {nick host hand chan arg} {
	upvar #0 wikipedia_mode wikipedia_mode_local
	pub_wikipedia_get [lindex $arg 2]
	pub_wikipedia_output $nick $chan
	return
}

proc pub_wikipedia_get {search_term} {
	upvar #0 wikipedia_output_raw wikipedia_output_raw_local wikipedia_mode wikipedia_mode_local
	set wikipedia_output_raw_local ""
	#if {[catch {exec curl --basic --output ~/eggdrop/scripts/wiki.temp.egt http://en.wikipedia.org/wiki/Special:Search?search=$search_term}]} {}
	if {[catch {exec curl --output scripts/wiki.temp.egt http://en.wikipedia.org/w/index.php?title=$search_term&format=xml}]} {}
	set file "./scripts/wiki.temp.egt"
	set temp_file [open $file "r"]
  set wikipedia_output_raw_local [read -nonewline $temp_file]
  close $temp_file
}



proc pub_wikipedia_output {nick chan} {
	upvar #0 wikipedia_output_raw wikipedia_output_raw_local wikipedia_mode wikipedia_mode_local phrase phrase_local
	set article_start 0
	set counter 0
	while {$counter <= [llength $wikipedia_output_raw_local]} {
		if {[lindex $wikipedia_output_raw_local $counter] == "<p><b>"} {
			set article_start $counter
			set counter [llength $wikipedia_output_raw_local]
		}
		incr counter
	}
	#putquick "PRIVMSG $chan :[lindex $wikipedia_output_raw_local $article_start]"
	return
	
}

proc pub_wikipedia_output_more {nick chan} {
	upvar #0 wikipedia_output_raw wikipedia_output_raw_local wikipedia_mode wikipedia_mode_local phrase phrase_local
	set counter 0
	set counter2 18
	set counter3 20
	while {$counter < 5} {
		set phrase_local [lindex $wikipedia_output_raw_local $counter2]
		pub_trim_left 7
		pub_trim_right 9
		set wikipedia_news1 $phrase_local
		set phrase_local [lindex $wikipedia_output_raw_local $counter3]
		pub_trim_left 6
		pub_trim_right 8
		set wikipedia_news2 $phrase_local
		putserv "PRIVMSG $nick :$wikipedia_news1 $wikipedia_news2"
		incr counter
		incr counter2 7
		incr counter3 7
	}
	return
}
