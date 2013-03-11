###################################################
########### Eggdrop Weather Script ################
# This script is provided freely use it however
# you want.
# It uses xml data provided by www.weatherroom.com
# The xml data can be used freely as long as you 
# say it was provided by weatherroom.
#
# some code borrowed from murf's weather script
# http://www.blueday.org/eggdrop.html
#
# Usage .wz zip code
# .wzf zip code for the forcast and extended info
# only works for US weather for now
#
# Written by Kirrilian (Glen)
# www.tenacious.us/projects/code/
# kirrilian@hotmail.com

set wzbind .wz
set wzfbind .wzf
set wz_url "/xml/zip/"
set wzf_url "/xml/ext/"
set wzsock ""

bind pub - .wz wzoutput
proc wzoutput { nick host hand chan text } {
	global wz_url 
	 if {[regexp {[0-9]} $text] == 1 && [string length $text] == 5} { 
		set wzsock [socket -async www.weatherroom.com 80]
		puts $wzsock "GET /xml/zip/$text"
	        flush $wzsock
		set i 1
		while {$i < 19} {
			incr i
			set output [gets $wzsock]
			if {$i < 7} continue;
				puthelp "NOTICE $nick : $output"
			}
		close $wzsock
	} else {
		puthelp "NOTICE $nick : Sorry that is an invalid entry"
		wzhelp $nick
        }
	return 0
}
bind pub - .wzf wzfoutput
proc wzfoutput { nick host hand chan text } {
	global wzf_url
	string tolower $text
         if {[regexp {[0-9]} $text] == 1 && [string length $text] == 5} {
		set wzsock [socket -async www.weatherroom.com 80]
                puts $wzsock "GET /xml/ext/$text"
                flush $wzsock
                set i 1
                while {$i < 38} {
                	incr i
	                set output [gets $wzsock]
	                if {$i < 9} continue;
			if {$i == 13 || $i == 37} continue;
			if {$i > 24 && $i < 34} continue; 
			puthelp "NOTICE $nick : $output"
                }
		close $wzsock
        } else {
                puthelp "NOTICE $nick : Sorry that is an invalid entry"
                wzhelp $nick
        }
        return 0
}

proc wzhelp {nick} {
	puthelp "NOTICE $nick : Usage: Type .wz zipcode or .wzf zipcode for the forcast"
	}

putlog "\WeatherRoom Version 1.0 created by Kirrilian is now loaded"

