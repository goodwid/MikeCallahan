# bofh.tcl / phrep_ - irc.quakenet.org

bind pubm - *Mike,~bofh* pub:bofh

proc pub:bofh { nick uhost handle channel arg } {

set fp [open "./scripts/bofh.egt" r]
set f [split [read $fp] \n]
close $fp

set l [rand [llength $f]]

putquick "PRIVMSG $channel :[lindex $f $l]"
putlog "$channel ($nick) !bofh"

}

putlog "bofh 0.2 - bofh excuses loaded."
