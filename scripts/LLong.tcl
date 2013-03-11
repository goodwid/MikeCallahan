# Lazarus Long Quotes
#
# Copyright 2006 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <420420@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

bind pubm - *Mike,~laz* pub:long

proc pub:long { nick uhost handle channel arg } {

set fp [open "./scripts/Lazarus.egt" r]
set f [split [read $fp] \n]
close $fp

set l [rand [llength $f]]

putquick "PRIVMSG $channel :[lindex $f $l]"
putlog "$channel ($nick) Mary, laz"

}

putlog "Lazarus Long sucessfully resurected."
