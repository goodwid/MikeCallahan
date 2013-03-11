bind pubm - *Mike,~handcuff* pub_handcuff

 
proc pub_handcuff {nick mask hand chan arg} {
	global patron 
	set patron [lindex $arg 2]
	if {$patron == "Mike" && $patron == "callahan" && $patron == "mike" && $patron == "Callahan"} {
		putserv "PRIVMSG $chan :\001ACTION handcuffs $nick instead.\001"
		putserv "PRIVMSG $chan :What, you thought I was gonna handcuff myself?"
		}
	if {$patron != "Mike" && $patron != "callahan" && $patron != "mike" && $patron != "Callahan"} {
			putserv "PRIVMSG $chan :\001ACTION handcuffs $patron for $nick and chuckles quietly.\001"
		}
}
