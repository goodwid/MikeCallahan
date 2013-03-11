# Eggdrop twitter search Script 
# Copyright 2006-2009 by Brendan K Callahan <brendan.k.callahan@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

proc pub_twitter {nick host hand chan arg} {
	upvar #0 user_pass user_pass_local twitter_msg twitter_msg_local

	if {![matchattr [nick2hand $nick] +T]} {
		putlog "$nick doesn't have +T"
		puthelp "NOTICE $nick :Sorry, you don't have authorization to post tweets."
		return
	}

	set file "./.twitter"
	set temp_file [open $file "r"]
  set target_temp [read -nonewline $temp_file]
  close $temp_file
  set user_pass_local $target_temp
	set twitter_msg_local ""
	pub_twitter_clean $nick $host $hand $chan $arg
	return
}


proc pub_twitter_clean {nick host hand chan arg} {
	upvar #0 twitter_msg twitter_msg_local
	
	set counter 2
	while {$counter < [llength $arg]} {
		lappend twitter_msg_local [lindex $arg $counter]
		incr counter
	}
	pub_twitter_140 $nick $host $hand $chan $arg
	set counter 0
	while {$counter < [llength $twitter_msg_local]} {
		append [lindex $twitter_msg_local $counter] "%20"
		incr counter
	}
}

proc pub_twitter_140 {nick host hand chan arg} {
	upvar #0 twitter_msg twitter_msg_local
	set twitter_length 0
	set counter 0
	while {$counter < [llength $twitter_msg_local]} {
		set twitter_length [expr [string length [lindex $twitter_msg_local $counter]] + $twitter_length - 2]
		incr counter
	}
	putlog "$twitter_length"
	if {$twitter_length > 140} {
		set excess 0
		set excess [expr $twitter_length-140]
		putquick "NOTICE $nick :Your requested twitter message exceeded 140 characters ($excess too many).  Please try again, and use both hands to count this time."
		return
	}
	pub_twitter_post
}
		

proc pub_twitter_post {} {
	upvar #0 user_pass user_pass_local twitter_msg twitter_msg_local recent_output recent_output_local
	check_recent_output twitter $twitter_msg_local
	if {$recent_output_local == 1} {putlog "$twitter_msg_local matches recent CEPT, not posting.";return}	
	if {[catch {exec curl --basic --user $user_pass_local --data status=$twitter_msg_local http://twitter.com/statuses/update.xml}]} {}
	cycle_recent_output twitter $twitter_msg_local 20
}
