# Mike's Lottery Generator Script 
# Copyright 2006 by Brendan K Callahan <420420@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
#
# http://commons.wikimedia.org/wiki/Image:ZIP_code_zones.png For the image used to derive the sort code.
# Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.2 or any later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts. A copy of the license is included in the section entitled "GNU Free Documentation License", for the above image.


putlog "Your lucky numbers are: 0, -3, 4i, x^2 and log(pi)"

global zipcode



proc pub_lottery {nick host hand chan arg} {
	upvar #0 zipcode zipcode_local
	upvar #0 xtra_status xtra_status_local
	get_xtra $nick "ZIPCODE" $chan
	set zipcode_local $xtra_status_local
	putlog "zip code retrieved: $zipcode_local"
	if {$zipcode_local == -1} {
		putserv "NOTICE $nick :You do not have your Zip Code set.  To give you the most accurate number sets, you will need to set your Zip Code.  Sorry, offer not availible in all areas."
		puthelp "NOTICE $nick :Please see http://3whack.org/mike/help.html and http://3whack.org/mike/helpbeta.html for instructions."
		return
	}
	putserv "PRIVMSG $chan :\001ACTION hands $nick a piece of paper with some numbers on it.\001"
	find_state $nick host hand chan arg
}
