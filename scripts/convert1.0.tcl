#  convert.tcl     based on rud-convert.tcl by rudenstam, http://www.distorted.se/tcl/
#
# conversion tool, relies on google to do the conversion, so anything you might write 
# for google to convert should work here too... 
#
# Copyright 2006-2008 by David Goodwin <goodwid@gmail.com> and Brendan K Callahan <brendan.k.callahan@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Original license:
# "Feel free to do whatever with this script as long as I'm credited as original author"
# 
#




putlog "Conversions on demand, loading. . ."


package require http

set rudconvert(version) 1.0a

proc rud:pub:convert { nick uhost hand chan arg } {
	set temp_arg [string trimleft [string tolower $arg] "mike, "]	
        set searchstring [http::formatQuery q $temp_arg]

        set url "http://www.google.com/search?$searchstring"
        ::http::config -useragent "Mozilla/5.001 (windows; U; NT4.0; en-us) Gecko/25250101"
        set token [::http::geturl $url]
        upvar #0 $token state
	putlog "Converting $temp_arg for $nick in $chan"
        
        if { [regexp -nocase {<img src=/images/calc_img\.gif width=40 height=30 alt=""></td><td>&nbsp;</td><td nowrap dir=ltr><h2 class=r><font size=\+1><b>(.+)</b></h2></td></tr><tr><td>} $state(body) match submatch] } {
                putserv "PRIVMSG $chan :[regsub -all {(\d)\s+(\d)} [regsub -all {<[a-zA-Z\/][^>]*>} [string map [list "&nbsp;" ""] $match] ""] {\1\2}]"
        } else {
                putserv "PRIVMSG $chan :Sorry, $nick, but I can't $temp_arg"
        }
        ::http::cleanup $token
}


